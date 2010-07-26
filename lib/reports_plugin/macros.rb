Redmine::WikiFormatting::Macros.register do
  desc "Display graphs/reports. With no argument, provide a list of available graphs.\n" +
       "Available graphs :\n" +
       "  !{{graph(Issues)}} -- display number of issues in the last 6 months"
  macro :graph do |obj, args|
    args, options = extract_macro_options(args, :parent)
    if args.size > 0
      graph = args.first
      #page = Wiki.find_page(args.first.to_s, :project => @project)
    end
    "Displaying graph #{graph}.."
  end
end
