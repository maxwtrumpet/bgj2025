﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ButtonNext : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        EventBus.Subscribe<ButtonPress>(_OnClick);
    }

    void _OnClick(ButtonPress e)
    {
        if (e.selected_button == gameObject) UnityEngine.SceneManagement.SceneManager.LoadScene("Level" + (int.Parse(UnityEngine.SceneManagement.SceneManager.GetActiveScene().name[5..]) + 1));
    }
}
