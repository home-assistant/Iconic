
# Global variables
has_app_changes = !git.modified_files.grep(/Source/).empty?
no_changelog_entry = !git.modified_files.include?("Changelog.md")


####################################################################################################

# Warn when there is a big PR
warn("This PR is too big. Consider breaking it down into multiple PRs.") if git.lines_of_code > 500

####################################################################################################

# Changelog entries are required for changes to library files.
if has_app_changes && no_changelog_entry
  fail("Any changes to Iconic need a summary in the Changelog.")
end

####################################################################################################

# Run SwiftLint
swiftlint.lint_files
