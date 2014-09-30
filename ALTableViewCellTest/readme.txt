I can't get dynamic type changes to update the font size in my custom table view cell.

I have a feeling it's because I'm doing it programatically. iOS8 is not supposed to need the UIContentSizeCategoryDidChangeNotification and I've seen sample apps working, but they all use storyboards. I'm only using a storyboard to assign the custom table view cell subclass but not definte its layout.

I have a feeling where I'm not implementing my auto layout constraints in the correct place, but I'm new to AL and struggling to understand the methods called by the view lifecycle and their order. (layoutSubviews, updateConstraints, etc.) If this was iOS7, I'd probably use the notification to mark the layout as dirty, but I'm not sure where that is supposed to happen in iOS8.
