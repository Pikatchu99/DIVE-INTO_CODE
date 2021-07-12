// Après avoir chargé le DOM, exécutez le traitement dans function ().
$(document).ready(function() {
    function score_indicate() {
        let subject_points = [Number($('#national_language').val()),
            Number($('#english').val()),
            Number($('#mathematics').val()),
            Number($('#science').val()),
            Number($('#society').val())
        ];
        let sum = 0;
        for (let i = 0; i < subject_points.length; i++)
            sum += subject_points[i];
        $("#sum_indicate").text(sum);
        let moyenne = sum / subject_points.length;
        $("#average_indicate").text(moyenne);
    };

    function get_achievement() {
        let averageIndicate = $("#average_indicate").text();
        console.log(averageIndicate)
        if (averageIndicate >= 80) {
            return "A";
        } else if (averageIndicate >= 60)
            return "B";
        else if (averageIndicate >= 40)
            return "C";
        else return "D";
    };

    function get_pass_or_failure() {
        let subject_points = [Number($('#national_language').val()),
            Number($('#english').val()),
            Number($('#mathematics').val()),
            Number($('#science').val()),
            Number($('#society').val())
        ];
        let number = subject_points.length;
        let judge = "Passer";

        for (let i = 0; i < number; i++) {
            if (subject_points[i] < 60) {
                judge = "Echoué"
                break;
            }
        }
        return judge;
    };

    function judgement() {
        let achievement = get_achievement();
        let pass_or_failure = get_pass_or_failure();
        $('#declaration').append(`<label id="alert-indicate" class="alert alert-info">Ton niveau${achievement}です。${pass_or_failure}です。</label>`);
    };
    $('#national_language, #english, #mathematics, #science, #society').change(function() {
        score_indicate();
    });
    $('#btn-evaluation').click(function() {
        $("#evaluation").text(get_achievement());
    });
    $('#btn-judge').click(function() {
        $("#judge").text(get_pass_or_failure());
    });
    $('#btn-declaration').click(function() {
        $("#declaration").css({
            height: "20px",
            padding: "10px",
            backgroundColor: "#bcf2f4",
            borderRadius: "8px",
        });
        $("#declaration").text(`Votre grade est ${get_achievement()}. Vous avez ${get_pass_or_failure()}.`);
    });
});