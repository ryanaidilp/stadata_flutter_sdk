import React from "react";
import clsx from "clsx";
import Link from "@docusaurus/Link";
import useDocusaurusContext from "@docusaurus/useDocusaurusContext";
import Layout from "@theme/Layout";
import HomepageFeatures from "@site/src/components/HomepageFeatures";

import Translate, { translate } from "@docusaurus/Translate";

import styles from "./index.module.css";

function HomepageHeader() {
  const { siteConfig } = useDocusaurusContext();
  return (
    <header className={clsx("hero hero--primary", styles.heroBanner)}>
      <div className="container">
        <div className={styles.heroContainer}>
          <div className={styles.heroContent}>
            <h1 className={clsx("hero__title", styles.heroTitle)}>
              {siteConfig.title}
            </h1>
            <p className={clsx("hero__subtitle", styles.heroSubtitle)}>
              {siteConfig.tagline}
            </p>
            <p className={styles.heroDescription}>
              <Translate id="homepage.hero.description">
                Seamlessly integrate Indonesia's official statistical data from BPS 
                (Badan Pusat Statistik) into your Flutter applications. Access economic 
                indicators, demographic data, publications, news, and comprehensive 
                statistical resources with just a few lines of code.
              </Translate>
            </p>
            <div className={styles.heroButtons}>
              <Link 
                className="button button--secondary button--lg" 
                to="/docs/quick-start"
              >
                <Translate id="homepage.cta.quickStart">
                  🚀 Quick Start
                </Translate>
              </Link>
              <Link 
                className="button button--outline button--lg" 
                to="/docs/api-docs/list/intro"
              >
                <Translate id="homepage.cta.apiDocs">
                  📚 API Documentation
                </Translate>
              </Link>
            </div>
            <div className={styles.heroStats}>
              <div className={styles.stat}>
                <div className={styles.statNumber}>15+</div>
                <div className={styles.statLabel}>
                  <Translate id="homepage.stats.apis">API Endpoints</Translate>
                </div>
              </div>
              <div className={styles.stat}>
                <div className={styles.statNumber}>500+</div>
                <div className={styles.statLabel}>
                  <Translate id="homepage.stats.domains">Administrative Domains</Translate>
                </div>
              </div>
              <div className={styles.stat}>
                <div className={styles.statNumber}>100%</div>
                <div className={styles.statLabel}>
                  <Translate id="homepage.stats.official">Official BPS Data</Translate>
                </div>
              </div>
            </div>
          </div>
          <div className={styles.heroCode}>
            <div className={styles.codeBlock}>
              <div className={styles.codeHeader}>
                <div className={styles.codeButtons}>
                  <span className={styles.codeButton}></span>
                  <span className={styles.codeButton}></span>
                  <span className={styles.codeButton}></span>
                </div>
                <span className={styles.codeTitle}>main.dart</span>
              </div>
              <pre className={styles.codeContent}>
                <code>{`// Initialize STADATA Flutter SDK
await StadataFlutter.instance.init(
  apiKey: 'YOUR_API_KEY',
);

// Get Indonesian provinces
final provinces = await StadataFlutter
  .instance.list.domains(
    type: DomainType.province,
    lang: DataLanguage.id,
  );

// Get economic publications
final publications = await StadataFlutter
  .instance.list.publications(
    domain: '0000',
    keyword: 'ekonomi',
  );

// Get detailed publication info
final publication = await StadataFlutter
  .instance.view.publication(
    id: publications.data.first.id,
    domain: '0000',
  );`}</code>
              </pre>
            </div>
          </div>
        </div>
      </div>
    </header>
  );
}

function QuickStartSection() {
  return (
    <section className={styles.quickStartSection}>
      <div className="container">
        <div className="row">
          <div className="col col--12">
            <h2 className={styles.sectionTitle}>
              <Translate id="homepage.quickStart.title">
                Get Started in Minutes
              </Translate>
            </h2>
            <p className={styles.sectionSubtitle}>
              <Translate id="homepage.quickStart.subtitle">
                Three simple steps to integrate Indonesian statistical data into your Flutter app
              </Translate>
            </p>
          </div>
        </div>
        <div className="row">
          <div className="col col--4">
            <div className={styles.quickStartStep}>
              <div className={styles.stepNumber}>1</div>
              <h3>
                <Translate id="homepage.quickStart.step1.title">Install SDK</Translate>
              </h3>
              <p>
                <Translate id="homepage.quickStart.step1.description">
                  Add the STADATA Flutter SDK to your project with a single command
                </Translate>
              </p>
              <div className={styles.miniCode}>
                <code>flutter pub add stadata_flutter_sdk</code>
              </div>
            </div>
          </div>
          <div className="col col--4">
            <div className={styles.quickStartStep}>
              <div className={styles.stepNumber}>2</div>
              <h3>
                <Translate id="homepage.quickStart.step2.title">Get API Key</Translate>
              </h3>
              <p>
                <Translate id="homepage.quickStart.step2.description">
                  Register for free at BPS Web API to get your API key
                </Translate>
              </p>
              <Link 
                className="button button--outline button--primary button--md"
                href="https://webapi.bps.go.id/developer/"
              >
                <Translate id="homepage.quickStart.step2.cta">Get API Key</Translate>
              </Link>
            </div>
          </div>
          <div className="col col--4">
            <div className={styles.quickStartStep}>
              <div className={styles.stepNumber}>3</div>
              <h3>
                <Translate id="homepage.quickStart.step3.title">Start Coding</Translate>
              </h3>
              <p>
                <Translate id="homepage.quickStart.step3.description">
                  Initialize the SDK and start accessing statistical data
                </Translate>
              </p>
              <Link 
                className="button button--primary button--md"
                to="/docs/quick-start"
              >
                <Translate id="homepage.quickStart.step3.cta">View Tutorial</Translate>
              </Link>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}

function DataShowcase() {
  return (
    <section className={styles.dataShowcase}>
      <div className="container">
        <div className="row">
          <div className="col col--12">
            <h2 className={styles.sectionTitle}>
              <Translate id="homepage.showcase.title">
                Rich Statistical Data at Your Fingertips
              </Translate>
            </h2>
            <p className={styles.sectionSubtitle}>
              <Translate id="homepage.showcase.subtitle">
                Access comprehensive datasets from Indonesia's national statistics office
              </Translate>
            </p>
          </div>
        </div>
        <div className="row">
          <div className="col col--6">
            <div className={styles.dataCategory}>
              <h3>
                <Translate id="homepage.showcase.economic.title">
                  📊 Economic Indicators
                </Translate>
              </h3>
              <ul>
                <li>
                  <Translate id="homepage.showcase.economic.gdp">
                    GDP and Economic Growth
                  </Translate>
                </li>
                <li>
                  <Translate id="homepage.showcase.economic.inflation">
                    Inflation and Price Indices
                  </Translate>
                </li>
                <li>
                  <Translate id="homepage.showcase.economic.trade">
                    Trade and Export-Import Data
                  </Translate>
                </li>
                <li>
                  <Translate id="homepage.showcase.economic.industrial">
                    Industrial Production Statistics
                  </Translate>
                </li>
              </ul>
            </div>
          </div>
          <div className="col col--6">
            <div className={styles.dataCategory}>
              <h3>
                <Translate id="homepage.showcase.demographics.title">
                  👥 Demographics & Social
                </Translate>
              </h3>
              <ul>
                <li>
                  <Translate id="homepage.showcase.demographics.population">
                    Population Census Data
                  </Translate>
                </li>
                <li>
                  <Translate id="homepage.showcase.demographics.education">
                    Education Statistics
                  </Translate>
                </li>
                <li>
                  <Translate id="homepage.showcase.demographics.employment">
                    Employment and Labor Force
                  </Translate>
                </li>
                <li>
                  <Translate id="homepage.showcase.demographics.health">
                    Health and Welfare Indicators
                  </Translate>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div className={styles.rowSpacer}>
          
        </div>
        <div className="row">
          <div className="col col--6">
            <div className={styles.dataCategory}>
              <h3>
                <Translate id="homepage.showcase.publications.title">
                  🏛️ Publications & Reports
                </Translate>
              </h3>
              <ul>
                <li>
                  <Translate id="homepage.showcase.publications.reports">
                    Official Statistical Reports
                  </Translate>
                </li>
                <li>
                  <Translate id="homepage.showcase.publications.research">
                    Research Publications
                  </Translate>
                </li>
                <li>
                  <Translate id="homepage.showcase.publications.yearbooks">
                    Statistical Yearbooks
                  </Translate>
                </li>
                <li>
                  <Translate id="homepage.showcase.publications.documentation">
                    Methodological Documentation
                  </Translate>
                </li>
              </ul>
            </div>
          </div>
          <div className="col col--6">
            <div className={styles.dataCategory}>
              <h3>
                <Translate id="homepage.showcase.news.title">
                  📰 News & Press Releases
                </Translate>
              </h3>
              <ul>
                <li>
                  <Translate id="homepage.showcase.news.latest">
                    Latest Statistical News
                  </Translate>
                </li>
                <li>
                  <Translate id="homepage.showcase.news.press">
                    Official Press Releases
                  </Translate>
                </li>
                <li>
                  <Translate id="homepage.showcase.news.announcements">
                    Data Release Announcements
                  </Translate>
                </li>
                <li>
                  <Translate id="homepage.showcase.news.infographics">
                    Infographics and Visualizations
                  </Translate>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}

function CTASection() {
  return (
    <section className={styles.ctaSection}>
      <div className="container">
        <div className="row">
          <div className="col col--12">
            <h2 className={styles.ctaTitle}>
              <Translate id="homepage.cta.title">
                Ready to Build Amazing Statistical Applications?
              </Translate>
            </h2>
            <p className={styles.ctaSubtitle}>
              <Translate id="homepage.cta.subtitle">
                Join developers building data-driven applications with Indonesia's official statistics
              </Translate>
            </p>
            <div className={styles.ctaButtons}>
              <Link 
                className="button button--secondary button--lg"
                to="/docs/quick-start"
              >
                <Translate id="homepage.cta.primary">Start Building Now</Translate>
              </Link>
              <Link 
                className="button button--outline button--lg"
                to="/docs/try-the-example"
              >
                <Translate id="homepage.cta.secondary">Try the Example</Translate>
              </Link>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}

export default function Home() {
  const { siteConfig } = useDocusaurusContext();
  return (
    <Layout
      title={`${siteConfig.title} - Flutter SDK for BPS Statistics`}
      description="The official Flutter SDK for integrating Indonesia's BPS (Badan Pusat Statistik) statistical data. Streamline data access for economic indicators, demographics, publications, and more."
    >
      <HomepageHeader />
      <main>
        <HomepageFeatures />
        <QuickStartSection />
        <DataShowcase />
        <CTASection />
      </main>
    </Layout>
  );
}