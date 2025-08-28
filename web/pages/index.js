import Head from 'next/head'

export default function Home() {
  return (
    <div>
      <Head>
        <title>Clinic Cloud Web - Test</title>
        <meta name="description" content="Test environment for Clinic Cloud patient portal" />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <main style={{ padding: '2rem', fontFamily: 'system-ui' }}>
        <h1>Clinic Cloud Patient Portal - Test</h1>
        <p>This is a test environment for the patient portal.</p>
        
        <div style={{ marginTop: '2rem' }}>
          <h2>Features:</h2>
          <ul>
            <li>Patient authentication</li>
            <li>Appointment scheduling</li>
            <li>Medical records access</li>
            <li>Treatment tracking</li>
          </ul>
        </div>

        <div style={{ marginTop: '2rem', padding: '1rem', backgroundColor: '#f0f0f0', borderRadius: '8px' }}>
          <p><strong>Status:</strong> Test deployment successful ✅</p>
        </div>
      </main>
    </div>
  )
}