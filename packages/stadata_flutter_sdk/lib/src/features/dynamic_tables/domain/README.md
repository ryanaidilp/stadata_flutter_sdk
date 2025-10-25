# Dynamic Tables API Structure

Based on actual BPS WebAPI response (`example_data_response.json`)

## API Endpoints

### List Endpoint
```
GET /api/list/model/data/domain/{domain}/key/{apiKey}/page/{page}
```

Returns paginated list of available variables (dynamic tables).

### Detail Endpoint
```
GET /api/list/model/data/domain/{domain}/var/{variableID}/key/{apiKey}
Optional: /th/{period}
```

Returns complete table data with multi-dimensional structure.

## Response Structure

```json
{
  "status": "OK",
  "data-availability": "available",
  "var": [
    {
      "val": 31,
      "label": "Jumlah Penduduk",
      "unit": "Jiwa",
      "subj": "Kependudukan",
      "def": "",
      "note": ""
    }
  ],
  "turvar": [
    {"val": 0, "label": "Tidak Ada"}
  ],
  "labelvervar": "Kecamatan",
  "vervar": [
    {"val": 7315, "label": "Pinrang"}
  ],
  "tahun": [
    {"val": 99, "label": "1999"},
    {"val": 100, "label": "2000"}
  ],
  "turtahun": [
    {"val": 0, "label": "Tahun"}
  ],
  "datacontent": {
    "7315310990": 308669,
    "73153101000": 311595
  }
}
```

## Composite Key Structure

Each key in `datacontent` is a composite of all dimensional values:

**Format:** `{vervar}{var}{turvar}{tahun}{turtahun}`

**Example:** `"7315310990"` breaks down as:
- `7315` = vervar (vertical variable ID - e.g., region Pinrang)
- `31` = var (variable ID - e.g., population variable)
- `0` = turvar (derived variable ID - 0 means no derived variable)
- `99` = tahun (period ID - year 1999)
- `0` = turtahun (derived period ID - 0 means no derived period)

## Parsing Strategy

1. **Extract Metadata Arrays**: Parse var[], vervar[], tahun[], turvar[], turtahun[]
2. **Parse Composite Keys**: Use metadata to determine segment boundaries
3. **Match Values**: Cross-reference IDs against metadata arrays
4. **Build Structure**: Create multi-dimensional table representation

## Data Transformation

The flat `datacontent` map can be transformed into:

### Matrix Structure
```
Period | Region | Value
1999   | Pinrang| 308669
2000   | Pinrang| 311595
```

### Hierarchical Structure
```
Variable -> Period -> Vertical Variable -> Value
Population -> 1999 -> Pinrang -> 308669
```

## Key Parsing Example

Given key `"7315310990"` with metadata:
- vervar values: [7315]
- var values: [31]
- turvar values: [0]
- tahun values: [99, 100, 101...]
- turtahun values: [0]

Parse by matching from left to right against known values.

## Implementation Notes

- Variable-length segments require metadata for parsing
- IDs don't have fixed widths (e.g., var can be 1-3 digits)
- Must parse in order: vervar -> var -> turvar -> tahun -> turtahun
- Use greedy matching with metadata validation
