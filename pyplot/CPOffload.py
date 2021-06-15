#!/bin/env python3
import matplotlib.pyplot as plt
import numpy as np

ypts = np.array([6286.04, 5332.07, 23.98, 23.74, 23.92, 23.93, 23.94, 24.01, 23.98, 24.01])
xpts = np.array([2078896, 305247, 157420, 64970, 32903, 16554, 11059, 8304, 6593, 5542])

f, (ax, ax2) = plt.subplots(2, 1, sharex=True)

ax.plot(xpts, ypts, marker='o')
ax2.plot(xpts, ypts, marker = 'o')

ax.set_ylim(5000, 6500)  # outliers only
ax2.set_ylim(0, 30)  # most of the data

ax.set_xscale('log')
ax2.set_xscale('log')
# hide the spines between ax and ax2
ax.spines['bottom'].set_visible(False)
ax2.spines['top'].set_visible(False)
ax.xaxis.tick_top()
ax.tick_params(labeltop=False)  # don't put tick labels at the top
ax2.xaxis.tick_bottom()

# This looks pretty good, and was fairly painless, but you can get that
# cut-out diagonal lines look with just a bit more work. The important
# thing to know here is that in axes coordinates, which are always
# between 0-1, spine endpoints are at these locations (0,0), (0,1),
# (1,0), and (1,1).  Thus, we just need to put the diagonals in the
# appropriate corners of each of our axes, and so long as we use the
# right transform and disable clipping.

d = .015  # how big to make the diagonal lines in axes coordinates
# arguments to pass to plot, just so we don't keep repeating them
kwargs = dict(transform=ax.transAxes, color='k', clip_on=False)
ax.plot((-d, +d), (-d, +d), **kwargs)        # top-left diagonal
ax.plot((1 - d, 1 + d), (-d, +d), **kwargs)  # top-right diagonal

kwargs.update(transform=ax2.transAxes)  # switch to the bottom axes
ax2.plot((-d, +d), (1 - d, 1 + d), **kwargs)  # bottom-left diagonal
ax2.plot((1 - d, 1 + d), (1 - d, 1 + d), **kwargs)  # bottom-right diagonal

# What's cool about this is that now if we vary the distance between
# ax and ax2 via f.subplots_adjust(hspace=...) or plt.subplot_tool(),
# the diagonal lines will move accordingly, and stay right at the tips
# of the spines they are 'breaking'

plt.xlabel("Sessions Handled/Second")
plt.ylabel("Latency (us)")
plt.show()