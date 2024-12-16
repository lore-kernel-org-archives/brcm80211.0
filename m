Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAF4204C0B
	for <brcm80211@lists.linux.dev>; Mon, 16 Dec 2024 12:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734351688; cv=none; b=pBuLiDHmzKD7pBfsA3nDLGjak6eONFpjLEDXwKnZhRtmdirneyGArq0a0ifRre5IJ/C2QAmwxvXmF8uTV1mfiulHBIm73BqIWp4+ywbMMUh1Fwa8uClFHT2HZAsdWQ9WdL2HvAwJISD8+FYZ0vqX9XxSbsxC5OEB7YCP9nquPPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734351688; c=relaxed/simple;
	bh=0WyC2IeHZDyDnuMsl52lnXq7+BKsXNMBc4Z+ascTm6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WmdxOov633JuAN2rUdd8BUoZY3M+SsUv/jpJwnd4wpXhONs5SMhpidLW7lrdjEOgOvw+ZJhl+/mufucDqDKUEgogaLlDBLrsy8gikDu0WdxXwfLlZ7ygdnXp1/eoEeedDxsbzLR6fZ79Un2sX/zrSTsKuJSy+jk7uzCb6caCZV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fh+k6vh6; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fh+k6vh6"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so3587385a91.1
        for <brcm80211@lists.linux.dev>; Mon, 16 Dec 2024 04:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734351685; x=1734956485; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WyC2IeHZDyDnuMsl52lnXq7+BKsXNMBc4Z+ascTm6M=;
        b=fh+k6vh6mpu/SEJ7z09LojpaB5Hazpl22LEBa2aLpicnQ4Kc8Ng7LaslR90xTswEAf
         r9wTPJu2TzR2DHybnpHvpbU+th9Iku30ixN5P+DPjB0IL6wigsu5UzYj70n3RAw6jTnJ
         jmMkbzYHhS79Vufx4sU4Y0teIJByuBVYVFxlSWUoZySTfHQhuRq23t3Kqm7zQH54RnUZ
         UiJ3RqFn4oaQbtlEhbImV7Yv5BRKjyskNuo91mL6J/I2NP1TIBGjIBrEon6plOq53zVK
         aH8EWbm1au1JsA2uGv1iUNPTOAf5WzqWbRSoyEh76Ytlr+5o0JhR5oRMPOzE4t55h6tG
         yGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734351685; x=1734956485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0WyC2IeHZDyDnuMsl52lnXq7+BKsXNMBc4Z+ascTm6M=;
        b=xKQl53RKP33BWYfEY01rs6qd1TWXaouQJzYdXTUxRXlE+FxG4DxPYM3rl4502WW6tj
         YWSFy3BQyR7IOUcEwydsaHEPekmHNSqoh/e8c0odq2DdvpmN2mLdEMdGSs8jWRfXg1BS
         G9YgUIyRwLR4cs0pGkgITP6B22p3zAULjkUhOvqaKoXCUGBjIlBoFNymi1cBvrM1VZGW
         ae9Cj+nQMLK3/7sDSAl+hOg9rocBk1gNVwBQ0DPRBqiXr/m2m3rQwISZH9NE00vTHhhT
         4VnVRvjQDYaYaeljg9lf+5yTTfqNNdslI5QM7ltmRvjT6GmjoyG4BzsCesreZjTqtUao
         OZ6g==
X-Gm-Message-State: AOJu0YyLSF5DNKylDXBf2DX/EzTW8qCIQS7ekAyJriwyS/vittRuKsWU
	5kO2VWc6KoKeZ8esIYrKuKq3ug3/rgGJkpBgW+Dsi4mXSQMFCf3s3VDMYCaEwBnhXK2a5d1atvC
	7/KUPU60am0569lizEfitNZrl/UE=
X-Gm-Gg: ASbGncvN1mcr7qMeRsxCmxG70sHUcU3Zwq5BHIrtmrn+L7sdXJVFyxuyJxFLYbfupMH
	jjPrWwhUT3vbcPNLtQETetdIYcMXLawDC+BajgOgOVvtx/53khjOrJzlT/p5Kjfpx5Vg8Br/t
X-Google-Smtp-Source: AGHT+IGR4UMN9R8ahkeZaGBKjWoFtKaVhjC3RwgJn+blQV7phArGzZZatHMcudEESime6WX6n9GN6o1X9UWU08NuL1c=
X-Received: by 2002:a17:90b:2541:b0:2ee:c918:cd42 with SMTP id
 98e67ed59e1d1-2f28fd704c1mr15976471a91.22.1734351684950; Mon, 16 Dec 2024
 04:21:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAG17S_OwtNxetb7XzsxkZcygH_CWkZx15evQZkThb3WjqpiKTQ@mail.gmail.com>
 <CAG17S_M9wxMsSNyqAQv2oxaCQZ9CAe=GHNjZCbw__2bsAg1hdg@mail.gmail.com>
 <ff9c1192-42b5-4a28-a8c9-31af9765cbff@broadcom.com> <CAG17S_PrigpkFP=5wcTL9UETwc6aHqXnuTEyeRrZ7Ey1cb-ZLw@mail.gmail.com>
 <193c1173968.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CAG17S_NwSKEJzbk7RNiOKqU_25f6muydbh0DN+ec1Ke6QrR1Qw@mail.gmail.com>
 <CAG17S_NqbLogvTWyoYobZ6kOpfXHnScfm4-dB1EqsmpB+q+zxA@mail.gmail.com>
 <21a81894-2e1e-440b-b7ea-27660fa08d9d@broadcom.com> <CAG17S_O5K4Uh2c6xqph5sUZe8gMjhD3z4FDkSSQ0dhCuZA6aug@mail.gmail.com>
 <193cb61e210.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CAG17S_P+cOQMpQda00JTCCKEB6MpPE4X2i8mRrEaM-n5YKdpNg@mail.gmail.com>
 <14ec6009-7b91-4a25-9943-f63da91d8c41@broadcom.com> <caa186d8-1e07-421d-a127-7bb6482ac704@broadcom.com>
In-Reply-To: <caa186d8-1e07-421d-a127-7bb6482ac704@broadcom.com>
From: KeithG <ys3al35l@gmail.com>
Date: Mon, 16 Dec 2024 06:21:13 -0600
Message-ID: <CAG17S_N0V=_Es0C7wA3fPu2MrBKBM7tEHRXOnVGWiUSxPucaRQ@mail.gmail.com>
Subject: Re: brcmfmac SAE/WPA3 negotiation
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: brcm80211@lists.linux.dev, linux-wireless@vger.kernel.org, 
	Denis Kenzior <denkenz@gmail.com>, James Prestwood <prestwoj@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 3:47=E2=80=AFAM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On 12/16/2024 10:43 AM, Arend van Spriel wrote:
> > On 12/16/2024 1:17 AM, KeithG wrote:
> >> On Sun, Dec 15, 2024 at 11:33=E2=80=AFAM Arend Van Spriel
> >> <arend.vanspriel@broadcom.com> wrote:
> >>>
> >>> On December 15, 2024 5:08:12 PM KeithG <ys3al35l@gmail.com> wrote:
> >>>
> >>>> On Sun, Dec 15, 2024 at 6:12=E2=80=AFAM Arend van Spriel
> >>>> <arend.vanspriel@broadcom.com> wrote:
> >>>>>
> >>>>> On 12/14/2024 2:34 PM, KeithG wrote:
> >>>>>> Arend,
> >>>>>>
> >>>>>> I looked through the info where I got the latest firmware:
> >>>>>> https://community.infineon.com/t5/Wi-Fi-Bluetooth-for-Linux/Wi-Fi-
> >>>>>> A-class-Linux-Driver-release-FMAC-2024-11-21-Documents/td-p/905045
> >>>>>> https://community.infineon.com/t5/AIROC-Wi-Fi-and-Wi-Fi-Bluetooth/
> >>>>>> Cypress-Linux-WiFi-Driver-Release-FMAC-2024-11-21/td-p/902888
> >>>>>> and did not find anything, but I really do not know what I am
> >>>>>> looking for.
> >>>>>
> >>>>> I think I had a bit more luck and maybe found the needle. I sent ou=
t
> >>>>> another RFT patch which hopefully gets rid of the BCME_BADLEN error=
.
> >>>>>
> >>>>> Regards,
> >>>>> Arend
> >>>> Arend,
> >>>>
> >>>> Can you send me a link to that patch? I want to try it.
> >>>
> >>> Hmm. I explicitly sent it to you, but here is a link to patchwork:
> >>>
> >>> https://patchwork.kernel.org/project/linux-wireless/
> >>> patch/20241215120401.238320-1-arend.vanspriel@broadcom.com/
> >>>
> >>> You can apply it on top of the other 3 patches.
> >>>
> >>> Regards,
> >>> Arend
> >>>
> >> Thanks! I got it.
> >> I am building now and have tried to apply what I think are the correct
> >> patches. They do not apply cleanly and I had to hand edit things. My
> >> guess is I messed something up.
> >> I will see what happens when I reboot. It'll take a few hours to build
> >> on my Pi4 then for me to install it on the 3b+ to test.
> >>
> >> I hope I understand which are the '3 other' patches.
> >>
> >> This is the one I got from your link:
> >> RFT-brcmfmac-Fix-structure-size-for-WPA3-external-SAE.diff
> >>
> >> These are what I understand are the '3 other patches'
> >> RFT-v2-1-3-wifi-brcmfmac-support-per-vendor-cfg80211-callbacks-and-
> >> firmware-events.patch.diff
> >> RFT-v2-2-3-wifi-brcmfmac-make-per-vendor-event-map-const.patch.diff
> >> RFT-v2-3-3-wifi-brcmfmac-cyw-support-external-SAE-authentication-in-
> >> station-mode.patch.diff
> >>
> >> If they are not correct could you send me links to them and I'll try
> >> again.
> >
> > You got it right. Kuddos.
>
> Ignored my spelling checker, but apparently it should be "kudos".
> Another lesson learned today.
>
> Regards,
> Arend
Arend,

Thanks for the confirmation. My attempt at a hand edit to apply the
rejected portions resulted in a failed build with the current RPiOS
kernel in the git repo:
# uname -a
Linux jackrune 6.6.64-v8+ #6 SMP PREEMPT Sun Dec 15 23:55:30 CST 2024
aarch64 GNU/Linux

When I try to apply them, I get this:
$ patch -Np1 -i
RFT-v2-1-3-wifi-brcmfmac-support-per-vendor-cfg80211-callbacks-and-firmware=
-events.patch.diff
patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
Hunk #1 FAILED at 6752.
1 out of 1 hunk FAILED -- saving rejects to file
drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c.rej
patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
Hunk #1 succeeded at 524 (offset 33 lines).
patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
Hunk #1 FAILED at 1359.
1 out of 1 hunk FAILED -- saving rejects to file
drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c.rej
patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c
Hunk #1 succeeded at 74 (offset -1 lines).
Hunk #2 succeeded at 336 (offset -70 lines).
patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvid.h
Hunk #1 FAILED at 15.
Hunk #2 succeeded at 47 with fuzz 1 (offset -9 lines).
1 out of 2 hunks FAILED -- saving rejects to file
drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvid.h.rej
$ patch -Np1 -i RFT-v2-
RFT-v2-1-3-wifi-brcmfmac-support-per-vendor-cfg80211-callbacks-and-firmware=
-events.patch.diff
RFT-v2-2-3-wifi-brcmfmac-make-per-vendor-event-map-const.patch.diff
RFT-v2-3-3-wifi-brcmfmac-cyw-support-external-SAE-authentication-in-station=
-mode.patch.diff
$ patch -Np1 -i
RFT-v2-2-3-wifi-brcmfmac-make-per-vendor-event-map-const.patch.diff
patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h
Hunk #1 FAILED at 337.
1 out of 1 hunk FAILED -- saving rejects to file
drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h.rej
$ patch -Np1 -i
RFT-v2-3-3-wifi-brcmfmac-cyw-support-external-SAE-authentication-in-station=
-mode.patch.diff
patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
Hunk #1 succeeded at 75 (offset 1 line).
Hunk #2 FAILED at 1940.
Hunk #3 FAILED at 2158.
Hunk #4 FAILED at 2216.
Hunk #5 succeeded at 5522 (offset 22 lines).
Hunk #6 succeeded at 5697 (offset 90 lines).
Hunk #7 succeeded at 6126 (offset 125 lines).
Hunk #8 succeeded at 7596 with fuzz 1 (offset 255 lines).
Hunk #9 FAILED at 7647.
4 out of 9 hunks FAILED -- saving rejects to file
drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c.rej
patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.h
Hunk #3 succeeded at 243 (offset 15 lines).
Hunk #4 FAILED at 244.
Hunk #5 succeeded at 507 (offset 18 lines).
1 out of 5 hunks FAILED -- saving rejects to file
drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.h.rej
patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
Hunk #1 FAILED at 8.
Hunk #2 FAILED at 39.
Hunk #3 FAILED at 49.
3 out of 3 hunks FAILED -- saving rejects to file
drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c.rej
patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_typ=
es.h
patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
Hunk #1 FAILED at 42.
1 out of 1 hunk FAILED -- saving rejects to file
drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c.rej
patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.h
Hunk #1 succeeded at 32 with fuzz 2 (offset 1 line).
Hunk #2 succeeded at 60 with fuzz 1 (offset 2 lines).
patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c
Hunk #1 FAILED at 450.
1 out of 1 hunk FAILED -- saving rejects to file
drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c.rej
patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h
Hunk #1 FAILED at 94.
1 out of 1 hunk FAILED -- saving rejects to file
drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h.rej
patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvid.h
Hunk #1 FAILED at 15.
Hunk #2 succeeded at 47 with fuzz 1 (offset -11 lines).
1 out of 2 hunks FAILED -- saving rejects to file
drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvid.h.rej
$ patch -Np1 -i RFT-brcmfmac-Fix-structure-size-for-WPA3-external-SAE.diff
patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_typ=
es.h

Is there another missing patch?

The kernel for the RPi is at this commit:
commit 80533a952218696c0ef1b346bab50dc401e6b74c (HEAD -> rpi-6.6.y,
origin/rpi-6.6.y, origin/HEAD)

Keith
