import { cp, mkdir, readFile, rm, stat, writeFile } from 'node:fs/promises'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)
const root = path.resolve(__dirname, '..')

const cesiumPackageFile = path.join(root, 'node_modules', 'cesium', 'package.json')
const sourceDir = path.join(root, 'node_modules', 'cesium', 'Build', 'Cesium')
const targetDir = path.join(root, 'public', 'Cesium')
const versionMarker = path.join(targetDir, '.version')

async function exists(filePath) {
  try {
    await stat(filePath)
    return true
  } catch {
    return false
  }
}

async function readCesiumVersion() {
  const pkgRaw = await readFile(cesiumPackageFile, 'utf8')
  const pkg = JSON.parse(pkgRaw)
  return pkg.version || 'unknown'
}

async function shouldSync(version) {
  if (!(await exists(path.join(targetDir, 'Cesium.js')))) return true
  if (!(await exists(versionMarker))) return true
  const current = (await readFile(versionMarker, 'utf8')).trim()
  return current !== version
}

async function main() {
  if (!(await exists(cesiumPackageFile))) {
    throw new Error('Missing dependency: cesium. Run `npm install` in campus-safety-frontend first.')
  }

  const version = await readCesiumVersion()
  if (!(await shouldSync(version))) {
    console.log(`[cesium] assets already synced (v${version})`)
    return
  }

  await mkdir(targetDir, { recursive: true })
  await rm(targetDir, { recursive: true, force: true })
  await mkdir(targetDir, { recursive: true })
  await cp(sourceDir, targetDir, { recursive: true })
  await writeFile(versionMarker, `${version}\n`, 'utf8')
  console.log(`[cesium] synced assets to public/Cesium (v${version})`)
}

main().catch((err) => {
  console.error(`[cesium] sync failed: ${err.message}`)
  process.exit(1)
})
