import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:html_unescape/html_unescape.dart';

/// A widget that renders HTML content with proper styling and fallback handling
///
/// This widget provides:
/// - HTML rendering for basic tags like <p>, <br>, <strong>, <em>, <b>, <i>
/// - Fallback to plain text if HTML parsing fails
/// - Consistent styling that matches the app's theme
/// - Performance optimization for scroll views
/// - Support for maxLines and overflow handling
class HtmlTextWidget extends StatelessWidget {
  const HtmlTextWidget({
    required this.data,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    super.key,
  });

  /// The HTML content to render
  final String data;

  /// Text style to apply (will be used as base style for HTML)
  final TextStyle? style;

  /// Maximum number of lines to display
  final int? maxLines;

  /// How to handle text overflow
  final TextOverflow? overflow;

  /// Text alignment
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    // Check if the content contains HTML tags
    if (!_containsHtml(data)) {
      // If no HTML tags, render as plain text for better performance
      return Text(
        data,
        style: style,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
      );
    }

    try {
      // Decode HTML entities and render HTML
      final unescapedData = HtmlUnescape().convert(data);

      return HtmlWidget(
        unescapedData,
        textStyle: style,
        onErrorBuilder: (context, element, error) => _buildFallbackText(),
        onLoadingBuilder:
            (context, element, loadingProgress) => _buildFallbackText(),
        customStylesBuilder: _buildCustomStyles,
      );
    } catch (e) {
      // Fallback to plain text if HTML parsing fails
      return _buildFallbackText();
    }
  }

  /// Check if the string contains HTML tags
  bool _containsHtml(String text) {
    final htmlTagRegex = RegExp('<[^>]*>');
    return htmlTagRegex.hasMatch(text);
  }

  /// Build fallback plain text widget
  Widget _buildFallbackText() {
    return Text(
      HtmlUnescape().convert(data),
      style: style,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }

  /// Build custom styles for HTML elements
  Map<String, String>? _buildCustomStyles(dynamic element) {
    if (element.localName == null) return null;

    switch (element.localName!) {
      case 'p':
        return {'margin': '0', 'padding': '0', 'line-height': '1.4'};
      case 'br':
        return {'display': 'block', 'margin': '4px 0'};
      case 'strong':
      case 'b':
        return {'font-weight': 'bold'};
      case 'em':
      case 'i':
        return {'font-style': 'italic'};
      default:
        return null;
    }
  }
}
