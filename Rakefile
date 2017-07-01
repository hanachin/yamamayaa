require "json"
require "rake/clean"

CLEAN << "homebridge-config.json"

desc "Generate homebridge-config.json"
file "homebridge-config.json" do
  bridge = {
    name: "Yamamayaa",
    username: "20:F8:5E:A4:6C:D6",
    port: 51826,
    pin: "031-45-154"
  }
  ir = JSON.load(File.read(".irkit.json")).fetch("IR")
  irkit = {
    accessory: "IRKit",
    name: "居間の電気",
    irkit_host: "iRKit6CD6.local",
    on_form: ir.fetch("light_on"),
    off_form: ir.fetch("light_off")
  }
  accessories = [irkit]
  config = {
    bridge: bridge,
    description: 'hi',
    accessories: accessories,
    platforms: []
  }
  File.write("homebridge-config.json", JSON.dump(config))
end

desc "deploy to yamamayaa"
task :deploy do
  sh 'bin/serverkit apply recipe.yml --hosts=yamamayaa.local --log-level=DEBUG'
end
