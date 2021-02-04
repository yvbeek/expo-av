package expo.modules.av.player;

public class Interstitial {
    public final String id;
    public final double startTime;
    public final double endTime;
    public final double duration;
    public final boolean skippable;

    public Interstitial(String id, double startTime, double duration, boolean skippable) {
        this.id = id;
        this.startTime = startTime;
        this.endTime = startTime + duration;
        this.duration = duration;
        this.skippable = skippable;
    }

    public boolean containsPosition(double position) {
        return position >= startTime && position < endTime;
    }
}
