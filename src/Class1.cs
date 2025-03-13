using BepInEx;
using UnityEngine;

namespace SimpleRoundsMod
{
    [BepInPlugin("com.yourname.simpleroundsmod", "Simple Rounds Mod", "1.0.0")]
    public class SimpleMod : BaseUnityPlugin
    {
        void Start()
        {
            Debug.Log("Simple Rounds Mod has loaded!");
        }

        void OnGUI()
        {
            GUI.Label(new Rect(10, 10, 200, 20), "Hello from Simple Rounds Mod!");
        }
    }
}