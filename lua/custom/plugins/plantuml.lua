return {
  'https://gitlab.com/itaranto/preview.nvim',
  version = '*',
  opts = {
    previewers_by_ft = {
      c = {
        name = 'plantuml_svg',
        renderer = { type = 'command', opts = { cmd = { 'feh' } } },
      },
    },
    previewers = {
      plantuml_svg = {
        args = { '-pipe', '-tpng' },
      },
    },
  },
}

-- @startuml
--   start
--   :test;
--   stop
-- @enduml
