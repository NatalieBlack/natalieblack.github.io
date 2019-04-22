// gulpfile.js
// Require the needed packages
var gulp = require('gulp');
var sass = require('gulp-sass');
 
gulp.task('sass', function (done) {
    gulp.src('scss/custom/*.scss')
        .pipe(sass())
        .pipe(gulp.dest('css'))

   done();
});

gulp.task('clean', function() {

})

gulp.task('watch', function() {
    gulp.watch('*.scss', ['sass']);
})


gulp.task('default', function(done) {  //<---- Insert 'done' as a parameter here...
    gulp.series('clean','sass', 'watch')
    done(); //<---- ...and call it here
})
