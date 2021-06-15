#!/bin/env python3
import matplotlib.pyplot as plt
import numpy as np

ypts = np.array([4786.46, 2193.88, 1911.172, 1285.15, 1050.58, 789.69, 719.4, 694.83, 660.34, 596.45 ])
xpts = np.array([666.2233333, 605.6, 555.16, 475.8666667, 416.3733333, 333.1, 277.5566667, 222.0416667, 166.4, 133.17 ])
# If we were to simply plot pts, we'd lose most of the interesting
# details due to the outliers. So let's 'break' or 'cut-out' the y-axis
# into two portions - use the top (ax) for the outliers, and the bottom
# (ax2) for the details of the majority of our data
# f, (ax, ax2) = plt.subplots(2, 1, sharex=True)
# plot the same data on both axes
#ax.plot(pts)
#ax2.plot(pts)

plt.plot(xpts, ypts, marker='o')
# f = plt.figure()
# ax2.iplot(xpts, ypts, marker = 'o')
# zoom-in / limit the view to different portions of the data
plt.ylim(0,5000)  # outliers only
plt.xlim(100, 700)  # most of the data

# ax.set_xscale('log')
# ax2.set_xscale('log')
# hide the spines between ax and ax2
#ax.spines['bottom'].set_visible(False)
#ax2.spines['top'].set_visible(False)
#ax.xaxis.tick_top()
#ax.tick_params(labeltop=False)  # don't put tick labels at the top
#ax2.xaxis.tick_bottom()

# This looks pretty good, and was fairly painless, but you can get that
# cut-out diagonal lines look with just a bit more work. The important
# thing to know here is that in axes coordinates, which are always
# between 0-1, spine endpoints are at these locations (0,0), (0,1),
# (1,0), and (1,1).  Thus, we just need to put the diagonals in the
# appropriate corners of each of our axes, and so long as we use the
# right transform and disable clipping.

# d = .015  # how big to make the diagonal lines in axes coordinates
# arguments to pass to plot, just so we don't keep repeating them
# kwargs = dict(transform=ax.transAxes, color='k', clip_on=False)
# ax.plot((-d, +d), (-d, +d), **kwargs)        # top-left diagonal
# ax.plot((1 - d, 1 + d), (-d, +d), **kwargs)  # top-right diagonal

# kwargs.update(transform=ax2.transAxes)  # switch to the bottom axes
# ax2.plot((-d, +d), (1 - d, 1 + d), **kwargs)  # bottom-left diagonal
# ax2.plot((1 - d, 1 + d), (1 - d, 1 + d), **kwargs)  # bottom-right diagonal

# What's cool about this is that now if we vary the distance between
# ax and ax2 via f.subplots_adjust(hspace=...) or plt.subplot_tool(),
# the diagonal lines will move accordingly, and stay right at the tips
# of the spines they are 'breaking'

plt.xlabel("Sessions Handled/Second")
plt.ylabel("Latency (us)")
plt.show()