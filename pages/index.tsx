import type { NextPage } from 'next'
import Head from 'next/head'
import Image from 'next/image'
import Projects from '../src/components/Projects'

const Home: NextPage = () => {
  return (
    <div>
      <Projects />
    </div>
  )
}

export default Home
