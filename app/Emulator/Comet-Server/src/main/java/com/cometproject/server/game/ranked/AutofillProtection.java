package com.cometproject.server.game.ranked;

/**
 * A player placed by autofill is protected: in their next match they must play their primary or secondary position.
 * The protection ends once they finish a match in one of those positions.
 */
public final class AutofillProtection {
    private AutofillProtection() {
    }

    public static boolean afterMatchFormed(boolean protectedBefore, boolean autofilled) {
        return protectedBefore || autofilled;
    }

    /**
     * Playing a preferred position consumes the protection; being autofilled again keeps it.
     */
    public static boolean afterMatchFinished(boolean autofilled) {
        return autofilled;
    }
}
