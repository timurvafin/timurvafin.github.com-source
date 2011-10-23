require 'fileutils'

desc 'Run the jekyll dev server'
task :server do
  system "jekyll --server --auto"
end

desc 'Deploy to production'
task :deploy => ['dev:off'] do

    `cp -R _public.git _site/.git`
    # "cd _site"
    # %q{ git add -A . },
    # %q{ git commit -m "`date`" },
    # %q{ git push -f origin master },
    # %q{ rm -rf ../_public.git },
    # %q{ mv .git ../_public.git },
    # %q{ cd ../ }

end

desc 'Create new post with given TITLE'
task :new do
  file = "_posts/#{Time.now.strftime('%F')}-#{ENV['TITLE']}.md"
  
  FileUtils.cp '_drafts/draft.md', file
  `mate #{file}`
end

namespace :dev do
  desc 'Un-publish old posts to speed up development'
  task :on do
    system 'find _posts -name "*.md" -exec sed -i "" "s|^published: true|published: false|g" {} \;'
  end

  desc 'Re-publish old posts for deployment'
  task :off do
    system 'find _posts -name "*.md" -exec sed -i "" "s|^published: false|published: true|g" {} \;'
  end
end

