return {
  dir = "~/Documents/Notes/", -- no need to call 'vim.fn.expand' here

  daily_notes = {
    folder = "000 Quick Capture/",
  },

  completion = {
    nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
  },

  -- Optional, customize how names/IDs for new notes are created.
  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    -- In this case a note with the title 'My new note' will given an ID that looks
    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
    local suffix = ""
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return tostring(os.time()) .. "-" .. suffix
  end,

  templates = {
    subdir = "Templates",
    date_format = "%Y-%m-%d-%a",
    time_format = "%H:%M",
  },

  -- https://github.com/Vinzent03/obsidian-advanced-uri
  use_advanced_uri = true,

  finder = "telescope.nvim",
}
