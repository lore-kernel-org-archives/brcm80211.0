Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DF34414
	for <brcm80211@lists.linux.dev>; Mon, 16 Dec 2024 00:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734308242; cv=none; b=CDSBvYb5d2LwyeBeImgDCHs3/U/KIqKSvicy/RtmbJdewQSotTt3K2sfEKXixjWE3ug3ZueZePmY4rdZF1QNyUEN8PUxJ1niUnmQ9CDiDqISdW5X8Z3jyr0czpko4Xxr4p2J7OGn+KjisyKigshLl4NomyO/53SB7BosYdzAO/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734308242; c=relaxed/simple;
	bh=sbekVCmKRocFcPwtHxauAhsfezZSxRGD/3PjkvWhUYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IRcaYAjks1mmxxAhtEvsv3XhA4Q48fo83oUlrGXQQy3rTzMSN1UqfngR4nHhDYptkmArf5J3JLVvQIOTVEs0CHerxM7vm8IDnuiRKGhXKlET0sSyVvACjpj9fAE50BN9n8uvsqkH2dBgPEx0BDe/lhDq1Tl/S/eu0S6EbO9dW1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXF7m1I9; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXF7m1I9"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ef748105deso2449107a91.1
        for <brcm80211@lists.linux.dev>; Sun, 15 Dec 2024 16:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734308240; x=1734913040; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbekVCmKRocFcPwtHxauAhsfezZSxRGD/3PjkvWhUYs=;
        b=aXF7m1I9aHeCFKSEtIaVMn5WnIwrQspXJVrLNxJtLcTc26yHRlkRcKTJUi6pv+gCAS
         xZ88x4k6dhiKqCfkT01o3nyGEbFObEWcpQvbGgkGyKKnyRZ3hWC4HD5R6YJl7S+WZ52H
         zoy5gn/NN3Dlur3l1gw+HiOBhCyZrtwxBAtAPxmMjjSHJpSJBG4yU5PSVMMCbK/oyjIm
         exRAyDxtSBu7V3WgJWQ55Gm+TcSa1yzNZ03L8fBmEcF9lMYzeyPCRAtQkxEbnpCblVBb
         OWQdQxxdmoCx6EIQZSYYo+fdgtvaKmK4PI0oUVewuyysfXgUvcIHB8NRPLlp5osrNyBj
         oiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734308240; x=1734913040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbekVCmKRocFcPwtHxauAhsfezZSxRGD/3PjkvWhUYs=;
        b=X+aIdF/zkgxvMnKYpGJYf3IJJk/RO1c8N/3CvGQU2EVhuT3whuPNJL63E7gt/5vlX8
         JH/LbNOVU6fNhIj+tEixoITCWL/LWQcI136/lWN2TI49ty/1XJ5Y0s5onMKEQp1m1igP
         tTMjrBJe8vw+Dzut37JfbZdso8pYNpJ1nUO5N5/eghGA2uz7fL744SykBap+WxDKUO4D
         Gc9N8tNE8GdoZa+SBhPsMleE548TojbUcKDcb5RaRCZ+lbBYyvqcV1P5366+2F5YB0g5
         3IwyzYrxsv3ri5zwQZ37N8ozTbPizOLer0HUvTCsfUXlJl9j+xe+6u5z8RYT3Jb3Yrgv
         hskA==
X-Gm-Message-State: AOJu0YzS+VyjIUBH4Kf0WcBBFDDP1jlNww4lUv3cwEzPIv8Na0bhW5Ax
	2EWUM0H1fOnUktPoOE6U/xT4CqQet4Uwpls9OOazn34+tOm69AK3YquZZ2YHC7bP4ttpOn7LDkG
	agpXaYalEuEdvoQ79kYrdOuY5i0w=
X-Gm-Gg: ASbGncsmqU15r2rZIYNIC8j0IUh8+rXM4dpDEUHqp0RiYPv/1GIBTrG8ds/2Wi1ONlR
	6CUeNSmOOSdpF2Mk8J2a4y0Zw8nJVZE+brqn3mCaXMA9r9vldvY7HbnMxQEbWVBBgiK2xMYo9
X-Google-Smtp-Source: AGHT+IG8tdIF0EwTFSj1uRNTsF5kCL7xwW7Y1CIdYDP8srAflVc8LeNu2xV952fzm5VmX4Np2R4/veZWwBqw1+e9kIs=
X-Received: by 2002:a17:90b:3e8e:b0:2ea:2a8d:dd2a with SMTP id
 98e67ed59e1d1-2f2900a98b4mr14885871a91.27.1734308240325; Sun, 15 Dec 2024
 16:17:20 -0800 (PST)
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
In-Reply-To: <193cb61e210.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
From: KeithG <ys3al35l@gmail.com>
Date: Sun, 15 Dec 2024 18:17:08 -0600
Message-ID: <CAG17S_P+cOQMpQda00JTCCKEB6MpPE4X2i8mRrEaM-n5YKdpNg@mail.gmail.com>
Subject: Re: brcmfmac SAE/WPA3 negotiation
To: Arend Van Spriel <arend.vanspriel@broadcom.com>
Cc: brcm80211@lists.linux.dev, linux-wireless@vger.kernel.org, 
	Denis Kenzior <denkenz@gmail.com>, James Prestwood <prestwoj@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2024 at 11:33=E2=80=AFAM Arend Van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On December 15, 2024 5:08:12 PM KeithG <ys3al35l@gmail.com> wrote:
>
> > On Sun, Dec 15, 2024 at 6:12=E2=80=AFAM Arend van Spriel
> > <arend.vanspriel@broadcom.com> wrote:
> >>
> >> On 12/14/2024 2:34 PM, KeithG wrote:
> >>> Arend,
> >>>
> >>> I looked through the info where I got the latest firmware:
> >>> https://community.infineon.com/t5/Wi-Fi-Bluetooth-for-Linux/Wi-Fi-A-c=
lass-Linux-Driver-release-FMAC-2024-11-21-Documents/td-p/905045
> >>> https://community.infineon.com/t5/AIROC-Wi-Fi-and-Wi-Fi-Bluetooth/Cyp=
ress-Linux-WiFi-Driver-Release-FMAC-2024-11-21/td-p/902888
> >>> and did not find anything, but I really do not know what I am looking=
 for.
> >>
> >> I think I had a bit more luck and maybe found the needle. I sent out
> >> another RFT patch which hopefully gets rid of the BCME_BADLEN error.
> >>
> >> Regards,
> >> Arend
> > Arend,
> >
> > Can you send me a link to that patch? I want to try it.
>
> Hmm. I explicitly sent it to you, but here is a link to patchwork:
>
> https://patchwork.kernel.org/project/linux-wireless/patch/20241215120401.=
238320-1-arend.vanspriel@broadcom.com/
>
> You can apply it on top of the other 3 patches.
>
> Regards,
> Arend
>
Thanks! I got it.
I am building now and have tried to apply what I think are the correct
patches. They do not apply cleanly and I had to hand edit things. My
guess is I messed something up.
I will see what happens when I reboot. It'll take a few hours to build
on my Pi4 then for me to install it on the 3b+ to test.

I hope I understand which are the '3 other' patches.

This is the one I got from your link:
RFT-brcmfmac-Fix-structure-size-for-WPA3-external-SAE.diff

These are what I understand are the '3 other patches'
RFT-v2-1-3-wifi-brcmfmac-support-per-vendor-cfg80211-callbacks-and-firmware=
-events.patch.diff
RFT-v2-2-3-wifi-brcmfmac-make-per-vendor-event-map-const.patch.diff
RFT-v2-3-3-wifi-brcmfmac-cyw-support-external-SAE-authentication-in-station=
-mode.patch.diff

If they are not correct could you send me links to them and I'll try again.

Keith
