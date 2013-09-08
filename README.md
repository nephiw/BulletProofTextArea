BulletProofTextArea
===================

The MX TextArea in flex has a lot of issues with bullets. In this exploration of that, I am reviewing a bug that appeared in my professional life where bullet colors have unexpected or unwanted behavior. The ones that I explore here are:
- Bullet styles match the style of the text, most obvious with text color.
- Anchor tags within bullet, if they share the same line as the bullet, will cause the bullet color to match the link, even on roll over.

A solution that I have used is to replace the list item tags `<li>` with '<textformat>' tags and use `blockindent` to ensure that the text that wraps looks right. This implementation has a few problems:
1.) if you add a class to the `<li>` the whole technique breaks down. This can be overcome by using better regular expressions.
2.) if you style the text by styling <p> or by using other html tags, you run into a problem where the calculated  textWidth of the bullet text does not match.  This is a bit more challenging to solve because you have to determine where in the DOM the bullets appear. 

There are several bugs/missing features with bullets.  For example, flash does not support sub-bullets or ordered lists.
