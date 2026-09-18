package com.cometproject.server.game.ranked;

import org.junit.Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class AutofillProtectionTest {
    @Test
    public void autofillTurnsProtectionOn() {
        assertTrue(AutofillProtection.afterMatchFormed(false, true));
    }

    @Test
    public void preferredPositionDoesNotChangeProtectionWhenTheMatchForms() {
        assertFalse(AutofillProtection.afterMatchFormed(false, false));
        assertTrue(AutofillProtection.afterMatchFormed(true, false));
    }

    @Test
    public void finishingInPreferredPositionConsumesProtection() {
        assertFalse(AutofillProtection.afterMatchFinished(false));
    }

    @Test
    public void finishingAutofilledAgainKeepsProtection() {
        assertTrue(AutofillProtection.afterMatchFinished(true));
    }

    @Test
    public void fullCycleAutofillThenPreferred() {
        boolean protectedFlag = false;

        protectedFlag = AutofillProtection.afterMatchFormed(protectedFlag, true);
        protectedFlag = AutofillProtection.afterMatchFinished(true);
        assertTrue("stays protected after the autofilled match", protectedFlag);

        protectedFlag = AutofillProtection.afterMatchFormed(protectedFlag, false);
        assertTrue("still protected while the next match is being played", protectedFlag);

        protectedFlag = AutofillProtection.afterMatchFinished(false);
        assertFalse("protection is used up after playing a preferred position", protectedFlag);
    }
}
