/*
 * Copyright (C) 2018 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.example.android.materialme;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.RadioButton;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

/***
 * Order Activity for the Droid Cafe app, handles dessert delivery method selection.
 */
public class OrderActivity extends AppCompatActivity {

    private static final String TAG = "OrderActivity";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_order);
    }

    /**
     * Muestra un mensaje Toast.
     * @param message Mensaje a mostrar.
     */
    public void displayToast(String message) {
        Toast.makeText(getApplicationContext(), message, Toast.LENGTH_SHORT).show();
    }

    /**
     * Maneja los clics en los RadioButtons.
     * @param view La vista que fue clickeada (el RadioButton).
     */
    public void onRadioButtonClicked(View view) {
        // ¿Está el botón ahora marcado?
        boolean checked = ((RadioButton) view).isChecked();

        // Comprueba qué RadioButton fue clickeado.
        switch (view.getId()) {
            case R.id.sameday:
                if (checked) {
                    // Servicio de mensajería el mismo día
                    displayToast(getString(R.string.chosen) + getString(R.string.same_day_messenger_service));
                }
                break;
            case R.id.nextday:
                if (checked) {
                    // Envío terrestre al día siguiente
                    displayToast(getString(R.string.chosen) + getString(R.string.next_day_ground_delivery));
                }
                break;
            case R.id.pickup:
                if (checked) {
                    // Recogida
                    displayToast(getString(R.string.chosen) + getString(R.string.pick_up));
                }
                break;
            default:
                // Algo salió mal.
                Log.d(TAG, getString(R.string.nothing_clicked));
                break;
        }
    }
}

