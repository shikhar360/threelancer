import type { NextPage } from 'next'

const Layout = ({children}: any) => {
  return (
    <div className='bg-[#131313] text-white'>
      <nav className='px-8 py-4 font-semibold text-4xl'>
        <div>threelancer</div>
      </nav>
      {children}
    </div>
  )
}

export default Layout;