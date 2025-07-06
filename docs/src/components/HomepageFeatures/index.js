import React from "react";
import clsx from "clsx";
import styles from "./styles.module.css";
import Translate from "@docusaurus/Translate";

const FeatureList = [
  {
    title: <Translate id="homepage.features.easyToUse.title">Easy to Use</Translate>,
    Svg: require("@site/static/img/undraw_easy_to_use.svg").default,
    description: (
      <Translate id="homepage.features.easyToUse.description">
        STADATA Flutter SDK was designed with developers in mind to be easily
        installed and used to get your Flutter or Dart app integrated with BPS API
        quickly. Just add your API key and start accessing statistical data.
      </Translate>
    ),
  },
  {
    title: <Translate id="homepage.features.comprehensive.title">Comprehensive Data Access</Translate>,
    Svg: require("@site/static/img/undraw_focus_on_matter.svg").default,
    description: (
      <Translate id="homepage.features.comprehensive.description">
        Access the complete range of BPS statistical data including economic indicators,
        demographic data, publications, news, press releases, and more. Both List and
        View APIs provide flexible data retrieval options.
      </Translate>
    ),
  },
  {
    title: <Translate id="homepage.features.powered.title">Powered by Dart & Flutter</Translate>,
    Svg: require("@site/static/img/dart-logo.svg").default,
    description: (
      <Translate id="homepage.features.powered.description">
        Built with modern Dart and Flutter technologies. Supports all platforms
        including Android, iOS, Web, and Desktop. Clean architecture with
        comprehensive error handling and type safety.
      </Translate>
    ),
  },
  {
    title: <Translate id="homepage.features.official.title">Official BPS Integration</Translate>,
    icon: "🏛️",
    description: (
      <Translate id="homepage.features.official.description">
        Direct integration with Indonesia's official statistical office (BPS).
        Access verified, authoritative data with real-time updates and
        comprehensive coverage of national statistics.
      </Translate>
    ),
  },
  {
    title: <Translate id="homepage.features.multilingual.title">Multilingual Support</Translate>,
    icon: "🌐",
    description: (
      <Translate id="homepage.features.multilingual.description">
        Built-in support for both Indonesian and English languages. Seamlessly
        switch between languages for international applications or local
        Indonesian market requirements.
      </Translate>
    ),
  },
  {
    title: <Translate id="homepage.features.developer.title">Developer Friendly</Translate>,
    icon: "🚀",
    description: (
      <Translate id="homepage.features.developer.description">
        Comprehensive documentation, code examples, error handling, and
        IntelliSense support. Get started quickly with our detailed guides
        and real-world implementation examples.
      </Translate>
    ),
  },
];

function Feature({ Svg, icon, title, description }) {
  return (
    <div className={clsx("col col--4")}>
      <div className="text--center">
        {Svg ? (
          <Svg className={styles.featureSvg} role="img" />
        ) : (
          <div className={styles.featureIcon}>
            <span className={styles.iconEmoji}>{icon}</span>
          </div>
        )}
      </div>
      <div className="text--center padding-horiz--md">
        <h3 className={styles.featureTitle}>{title}</h3>
        <p className={styles.featureDescription}>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures() {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          <div className="col col--12">
            <h2 className={styles.featuresTitle}>
              <Translate id="homepage.features.title">
                Why Choose STADATA Flutter SDK?
              </Translate>
            </h2>
            <p className={styles.featuresSubtitle}>
              <Translate id="homepage.features.subtitle">
                Everything you need to build powerful statistical applications with Indonesian government data
              </Translate>
            </p>
          </div>
        </div>
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
        <div className="row">
          <div className="col col--12">
            <div className={styles.featuresFooter}>
              <h3>
                <Translate id="homepage.features.footer.title">
                  Trusted by Developers, Powered by Official Data
                </Translate>
              </h3>
              <p>
                <Translate id="homepage.features.footer.description">
                  Built in collaboration with Indonesia's national statistical standards and 
                  best practices for data access and integration.
                </Translate>
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}