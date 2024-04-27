import ddf.minim.AudioPlayer;
import ddf.minim.Minim;

public class Bgm {
    // Background music files for different game levels and events
    public static final String bgmLevelBegin = "mainMenu.wav";
    public static final String bgmLevelMap1 = "bgmLevelMap1.mp3";
    public static final String bgmBullet1 = "bullet1.mp3";
    
    // Audio player instances for different sounds
    static AudioPlayer playerLevelBegin, playerLevelSet, playerLevelMap1;
    static Minim minim;

    // Initialize audio players with the Minim library passed from the main game setup
    public static void setup(Minim m) {
        minim = m;
        playerLevelBegin = minim.loadFile(bgmLevelBegin);
        playerLevelSet = minim.loadFile(bgmBullet1); // Likely a mistake, should be another file
        playerLevelMap1 = minim.loadFile(bgmLevelMap1);
    }

    // Start or stop background music based on the game level
    public static void bgmStart(Level level){
        if(level == Level.LEVEL_BEGIN){
            if(!playerLevelBegin.isPlaying()){
                playerLevelBegin.rewind();
                playerLevelBegin.play();
            }
        } else {
            playerLevelBegin.pause();
        }
        
        if(level == Level.LEVEL_SET){
            if(!playerLevelSet.isPlaying()){
                playerLevelSet.rewind();
                playerLevelSet.play();
            }
        } else {
            playerLevelSet.pause();
        }
        
        if(level == Level.LEVEL_MAP1){
            if(!playerLevelMap1.isPlaying()){
                playerLevelMap1.rewind();
                playerLevelMap1.play();
            }
        } else {
            playerLevelMap1.pause();
        }
    }

    // Increase or decrease the volume of all music players
    public static void increaseVolume() {
        setGain(1.0); // Increase volume by 1.0 dB
    }

    public static void decreaseVolume() {
        setGain(-1.0); // Decrease volume by 1.0 dB
    }

    // Set the volume gain for each audio player, ensuring it stays within bounds
    private static void setGain(double change) {
        // Apply volume change and clamp value between -80 dB and 0 dB
        playerLevelBegin.setGain(Math.max(-80, Math.min(0, playerLevelBegin.getGain() + change)));
        playerLevelSet.setGain(Math.max(-80, Math.min(0, playerLevelSet.getGain() + change)));
        playerLevelMap1.setGain(Math.max(-80, Math.min(0, playerLevelMap1.getGain() + change)));
    }
}
