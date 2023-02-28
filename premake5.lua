-- premake.lua
workspace ("Ping Pong")
    configurations ({ "Debug", "Release" })
    platforms { "Win64" }

project ("Ping Pong")
    kind ("ConsoleApp")
    language ("C++")
    -- Build Executable
    targetdir ("build/%{cfg.buildcfg}/%{cfg.architecture}")
    -- Intermediate Files
    objdir("bin/%{cfg.buildcfg}/%{cfg.architecture}")
   
    files ({ "**.hpp", "**.cpp", "**.h", "**.c" })
    includedirs ({"include"})
    libdirs ({"lib"})
    links({"flac.lib", "freetype.lib", "ogg.lib", "openal32.lib", "vorbis.lib", "vorbisenc.lib", "vorbisfile.lib","opengl32.lib", "winmm.lib", "ws2_32.lib", "gdi32.lib"})
    defines({"SFML_STATIC"})

    filter ("configurations:Debug")
        defines ({ "DEBUG" })
        symbols ("On")
                links ({"sfml-audio-s-d.lib", "sfml-graphics-s-d.lib", "sfml-network-s-d.lib", "sfml-system-s-d.lib", "sfml-window-s-d.lib", "sfml-main-d.lib"})

    filter ("configurations:Release")
        defines ({ "NDEBUG" })
        optimize ("On")
        links ({"sfml-audio-s.lib", "sfml-graphics-s.lib", "sfml-network-s.lib", "sfml-system-s.lib", "sfml-window-s.lib", "sfml-main.lib"})

        
    filter  ("platforms:x64") 
        system ("Windows")
        architecture ("x86_64")