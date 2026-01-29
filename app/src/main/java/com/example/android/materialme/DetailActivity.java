package com.example.android.materialme;

import android.os.Bundle;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.bumptech.glide.Glide;

/**
 * Detail Activity that shows details about a selected sport.
 */
public class DetailActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail);

        // Initialize the views.
        TextView sportsTitle = findViewById(R.id.titleDetail);
        ImageView sportsImage = findViewById(R.id.sportsImageDetail);

        // Get the title and image resource from the Intent.
        String title = getIntent().getStringExtra("title");
        int imageResource = getIntent().getIntExtra("image_resource", 0);

        // Set the title.
        sportsTitle.setText(title);

        // Load the image using Glide.
        Glide.with(this).load(imageResource).into(sportsImage);
    }
}

