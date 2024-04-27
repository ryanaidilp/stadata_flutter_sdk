import React from "react";
import clsx from "clsx";
import styles from "./styles.module.css";

const FeatureList = [
  {
    title: "Easy to Use",
    Svg: require("@site/static/img/undraw_easy_to_use.svg").default,
    description: (
      <>
        STADATA Flutter SDK was designed with developer in mind to be easily
        installed and used to get your Flutter or Dart app integragte to BPS API
        quickly.
      </>
    ),
  },
  {
    title: "Focus on What Matters",
    Svg: require("@site/static/img/undraw_focus_on_matter.svg").default,
    description: (
      <>
        STADATA Fluter SDK lets you focus on your docs, and we&apos;ll do the
        chores. Go ahead and just add your <code>API Key</code> from BPS API.
      </>
    ),
  },
  {
    title: "Powered by Dart",
    Svg: require("@site/static/img/dart-logo.svg").default,
    description: (
      <>
        Powered by Dart and Flutter. Easily integragte WEB API BPS into your
        dart or flutter app.
      </>
    ),
  },
];

function Feature({ Svg, title, description }) {
  return (
    <div className={clsx("col col--4")}>
      <div className="text--center">
        <Svg className={styles.featureSvg} role="img" />
      </div>
      <div className="text--center padding-horiz--md">
        <h3>{title}</h3>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures() {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
