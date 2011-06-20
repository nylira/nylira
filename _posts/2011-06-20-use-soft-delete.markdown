---
layout: en-article
category: en-articles
title: Use Soft Delete
---

The situation: Imagine you're using one of the many generic todo list apps on the web. You're feeling great, because you just finished an entire laundry list of tasks. You've opened the web app because it's time for you to delete the 9 tasks from your list.

You see in front of you a massive list of tasks, each with its own discrete "Delete" button. This gives you pause. You click "Delete" on the first of your completed tasks, and a modal window pop up, "Are you sure you want to permanently delete this task?" Yes / No. You sign inwardly and press "Yes".

You might do this another 8 times, each time getting more exasperated at the number of hoops you have to jump through to delete a single task. If you're the less patient type, you may consider give up on the app altogether, because micromanaging tasks is almost more effort than doing the them!

## Be Like Gmail

Instead of rudely throwing a modal dialog in your user's face, consider using Gmail's method: soft delete. After every user's atomic operation, Gmail displays a nonintrusive status message at the top of the screen. It tells the user what exactly has occured--e.g., "This conversation has been archived."--and a simple "Undo" link.

Why is soft delete better than modal confirmations? For one, this method allows the user to more rapidly perform delete operations by bypassing the modal middleman. Modal windows are intrusive, workflow-breaking, and forces the user to make immediate, uninformed decisions. Inline undos are far more user-friendly because the web app stays responsive. And let's face it--most deleted files are never wanted back.

## Taking It Further

Native OS filesystems allow clicking and dragging to lasso multiple documents in a folder. We've used this simple operation on our desktop for years, but it has yet to show up online. Select-lassos could work very well for photography-oriented apps.

## Don't Delete Anything

Disk-space is cheap, and user whims are fickle. If you can absorb the extra costs, I suggest never permanently deleting anything (unless they delete their account). Give your user a history page, where they can restore the state of everything they've ever created or uploaded with your app. When the time comes, they'll love you for it.
 
