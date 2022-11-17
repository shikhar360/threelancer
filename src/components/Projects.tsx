
const projects = [
  {
    "id": 1,
    "name": "Build a DEX",
    "desc": "Build a DEX application using biconomy, Build a DEX application using biconomy, Build a DEX application using biconomy",
    "deadline": new Date().toISOString(),
    "bounty": "$2000",
    "condition": "Active",
    "owner": "0xaayushd.eth"
  },
  {
    "id": 2,
    "name": "Build a DEX",
    "desc": "Build a DEX application using biconomy",
    "deadline": new Date().toISOString(),
    "bounty": "$2000",
    "condition": "Active",
    "owner": "0xaayushd.eth"
  },
  {
    "id": 3,
    "name": "Build a DEX",
    "desc": "Build a DEX application using biconomy",
    "deadline": new Date().toISOString(),
    "bounty": "$2000",
    "condition": "Active",
    "owner": "0xaayushd.eth"
  }
]


const Projects = () => {
  return (
    <div className="flex flex-col mt-20 mx-28">
      <section className="flex flex-row justify-between">
        <h1 className=" font-semibold text-6xl mx-3 mb-6">Projects</h1>
        <div>
          <button className="bg-gradient-to-r from-purple-600 to-purple-800 text-white px-4 py-4 rounded-lg mx-3 hover:bg-none hover:border-2 border-purple-600">New Projects</button>
        </div>
      </section>
      <div className="divider w-full h-1 bg-gray-500 my-4"></div>
      <section className="flex flex-wrap w-full justify-center">
        {projects.map(project => <Project project={project} key={project.id}/>)}
        {projects.map(project => <Project project={project} key={project.id}/>)}
        {projects.map(project => <Project project={project} key={project.id}/>)}
        
      </section>
    </div>
  )
}

const Project = ({project}: any) => {
  return (
    <button className="card flex flex-col items-center w-96 hover:z-10 hover:scale-110 hover:shadow-lg hover:shadow-purple-500 ease-in duration-500 overflow-hidden bg-[#222222] px-4 py-4 rounded-xl mx-4 my-2">
      <div className="flex flex-row items-center justify-center mb-4">
        <p className="text-6xl font-extrabold">{project.id}</p>
        <h2 className="text-4xl ml-4">{project.name}</h2>
      </div>
      <p className=" font-light text-gray-300 px-6">{project.desc}</p>
    </button>
  )
}

export default Projects;