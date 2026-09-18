package com.cometproject.server.game.ranked;

/**
 * How wide the matchmaker searches, based on how long the oldest player in the search has been waiting.
 *
 * 0-15s: +-50 MMR, primary position only. 16-45s: +-150, secondary allowed. 46-90s: +-300, unprotected players may
 * be autofilled. Over 90s: +-500.
 */
public final class SearchWindow {
    private final int mmrMargin;
    private final boolean secondaryAllowed;
    private final boolean autofillAllowed;

    private SearchWindow(int mmrMargin, boolean secondaryAllowed, boolean autofillAllowed) {
        this.mmrMargin = mmrMargin;
        this.secondaryAllowed = secondaryAllowed;
        this.autofillAllowed = autofillAllowed;
    }

    public static SearchWindow forWait(long waitSeconds) {
        if (waitSeconds <= 15) {
            return new SearchWindow(50, false, false);
        }

        if (waitSeconds <= 45) {
            return new SearchWindow(150, true, false);
        }

        if (waitSeconds <= 90) {
            return new SearchWindow(300, true, true);
        }

        return new SearchWindow(500, true, true);
    }

    public int getMmrMargin() {
        return this.mmrMargin;
    }

    public boolean isSecondaryAllowed() {
        return this.secondaryAllowed;
    }

    public boolean isAutofillAllowed() {
        return this.autofillAllowed;
    }
}
