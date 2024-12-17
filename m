Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7ECA29
	for <brcm80211@lists.linux.dev>; Tue, 17 Dec 2024 00:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734394420; cv=none; b=B4C4rpyrG08ts+5Mu7ucuj4dYzZ0LnOd9PXQ5XxVUNu4UlFlJNVmIj+9JZo4Q+hvHrTqdbhE/pjnJuiyasKq86oulxXpmtMDk7OvGQS0TjSWc/u5B/EORqZFgJhRijx8pvz6SZ5FDFmSrW/uRCcPzDdtfKwUsxgSdy85K5xf4zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734394420; c=relaxed/simple;
	bh=Eq6e+Iy+6Y/uUCJtG4zEQrS2FYB7VtBPPclfmv/HM7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N9xbeYhXfC5s7cnFdP6Qx2ZLMk2c3AdcAH8HV7mou6w+wNNGSbBVkKawRMSMxrf9HYrqGZf1gfZ1gd6VQrdD6mZ3HD+t40/Ts8xcoCvU4Omea6fFFV1R7zHF1ryfHkQrQKfgVzWll29LqTDPazpATwTZCxrOCyjYDsoiWl/bjvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esGW2PmE; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esGW2PmE"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso3221569a91.3
        for <brcm80211@lists.linux.dev>; Mon, 16 Dec 2024 16:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734394418; x=1734999218; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eq6e+Iy+6Y/uUCJtG4zEQrS2FYB7VtBPPclfmv/HM7Y=;
        b=esGW2PmEw0PO/GCJDc7PyDCuRJhvIIVqFxe2XZHOeG8wwbnYPmSll+UPtX6nD0MBsV
         bsv3ZswRAHDuNNW5e0aOSilSHgodyy6Cu3AxSU3cnovW4Tr2JumP+f50Ce5Ajmt98S25
         bbobcxPIZucnOoOcRfGU2Jty4sa4ZvEQbQY9Yv3q18DXePUHyX3VnX6QNKfRWrPBUSJf
         5I6NZ9I1UOkYbRbI//Wj2c1hHT7GcvE6ZJ6qb4DbCrRuX+AD6HPBtRDf+2QYLHmf/0R1
         dEnEKKIQmQUGhqK24P2HSpOoZp446BsXhb7lBuY17OKx/BaR6+qM2dzt3IGzY6bErpt+
         qcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734394418; x=1734999218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eq6e+Iy+6Y/uUCJtG4zEQrS2FYB7VtBPPclfmv/HM7Y=;
        b=HnaCKvBk3CjxPX32vz5DxtrvIdiTrG5eyDx2U54kE3Bp4TBurmXute3DK9Q29tdzVU
         cCyHv8htTCpeuKibGpD8telsWhC51lu1A7dwZm+1h4QeWCHzYrGOhUjMUKwPXmOXPaux
         u2oOv1JfZcqbFhkv8+M2m8xmKg0Wdt2FQ9A5XwKu5uIOHpYJxBxszRNNtcmlzZRtricV
         StIk8trK3cu9J5JhgtYUMTGuFiaiSoflnwTUBujgZuQUVyOruxJ6BfVgqUPbEteLOJKo
         xYXK4y6cHCPFVBNgGl4y71O9CkqmeslL6Y/trk0U6/8NyC1zpacQ8OIa793XUWI9GpMh
         VkKw==
X-Gm-Message-State: AOJu0YxdkOPU2UFe2oTSswOLKajKrJTIjgtHFEz+CTmZNIqfpthaFddl
	wcHmXHcdDAjEPiDDpB0Rg0S4eV0ZLvTXMRy++VsBe1XRjsrn/lIQ4sPvRSD+QPvF/LFU89EIqM1
	ybhQbiEQUxhFL+O4OY/VixOMXHZI=
X-Gm-Gg: ASbGncuk7ZJ+jG0t10ui6sVNeu1ZQG6+QDgkjdPn47aa9LmBuomPkGJjg6dTjRPYwQ7
	Bwjy2fdKtRe7sToAseHjH6lSxlFjeETCn6ROW+RECVwXt8Hx2h6QrV4Azw/hoVlBeHvayLTSC
X-Google-Smtp-Source: AGHT+IECVaH0EpV01FwfEyMg5UJRvQ86VjzOfusekHopJEImmYd9bn+YjYOHpX1K9VONn207fbleSvwGwouahO0awiU=
X-Received: by 2002:a17:90a:ea93:b0:2ee:9a82:5a93 with SMTP id
 98e67ed59e1d1-2f28fb67161mr22525767a91.14.1734394418414; Mon, 16 Dec 2024
 16:13:38 -0800 (PST)
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
 <CAG17S_N0V=_Es0C7wA3fPu2MrBKBM7tEHRXOnVGWiUSxPucaRQ@mail.gmail.com> <ec23f0d9-a23c-4684-b0b6-a89141c5ec37@broadcom.com>
In-Reply-To: <ec23f0d9-a23c-4684-b0b6-a89141c5ec37@broadcom.com>
From: KeithG <ys3al35l@gmail.com>
Date: Mon, 16 Dec 2024 18:13:27 -0600
Message-ID: <CAG17S_PmXNP2bdUU5ErQd-N2jyScqvfKTFsnWgADb3uhqpBsZA@mail.gmail.com>
Subject: Re: brcmfmac SAE/WPA3 negotiation
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: brcm80211@lists.linux.dev, linux-wireless@vger.kernel.org, 
	Denis Kenzior <denkenz@gmail.com>, James Prestwood <prestwoj@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 1:50=E2=80=AFPM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On 12/16/2024 1:21 PM, KeithG wrote:
> > On Mon, Dec 16, 2024 at 3:47=E2=80=AFAM Arend van Spriel
> > <arend.vanspriel@broadcom.com> wrote:
> >>
> >> On 12/16/2024 10:43 AM, Arend van Spriel wrote:
> >>> On 12/16/2024 1:17 AM, KeithG wrote:
> >>>> On Sun, Dec 15, 2024 at 11:33=E2=80=AFAM Arend Van Spriel
> >>>> <arend.vanspriel@broadcom.com> wrote:
> >>>>>
> >>>>> On December 15, 2024 5:08:12 PM KeithG <ys3al35l@gmail.com> wrote:
> >>>>>
> >>>>>> On Sun, Dec 15, 2024 at 6:12=E2=80=AFAM Arend van Spriel
> >>>>>> <arend.vanspriel@broadcom.com> wrote:
> >>>>>>>
> >>>>>>> On 12/14/2024 2:34 PM, KeithG wrote:
> >>>>>>>> Arend,
> >>>>>>>>
> >>>>>>>> I looked through the info where I got the latest firmware:
> >>>>>>>> https://community.infineon.com/t5/Wi-Fi-Bluetooth-for-Linux/Wi-F=
i-
> >>>>>>>> A-class-Linux-Driver-release-FMAC-2024-11-21-Documents/td-p/9050=
45
> >>>>>>>> https://community.infineon.com/t5/AIROC-Wi-Fi-and-Wi-Fi-Bluetoot=
h/
> >>>>>>>> Cypress-Linux-WiFi-Driver-Release-FMAC-2024-11-21/td-p/902888
> >>>>>>>> and did not find anything, but I really do not know what I am
> >>>>>>>> looking for.
> >>>>>>>
> >>>>>>> I think I had a bit more luck and maybe found the needle. I sent =
out
> >>>>>>> another RFT patch which hopefully gets rid of the BCME_BADLEN err=
or.
> >>>>>>>
> >>>>>>> Regards,
> >>>>>>> Arend
> >>>>>> Arend,
> >>>>>>
> >>>>>> Can you send me a link to that patch? I want to try it.
> >>>>>
> >>>>> Hmm. I explicitly sent it to you, but here is a link to patchwork:
> >>>>>
> >>>>> https://patchwork.kernel.org/project/linux-wireless/
> >>>>> patch/20241215120401.238320-1-arend.vanspriel@broadcom.com/
> >>>>>
> >>>>> You can apply it on top of the other 3 patches.
> >>>>>
> >>>>> Regards,
> >>>>> Arend
> >>>>>
> >>>> Thanks! I got it.
> >>>> I am building now and have tried to apply what I think are the corre=
ct
> >>>> patches. They do not apply cleanly and I had to hand edit things. My
> >>>> guess is I messed something up.
> >>>> I will see what happens when I reboot. It'll take a few hours to bui=
ld
> >>>> on my Pi4 then for me to install it on the 3b+ to test.
> >>>>
> >>>> I hope I understand which are the '3 other' patches.
> >>>>
> >>>> This is the one I got from your link:
> >>>> RFT-brcmfmac-Fix-structure-size-for-WPA3-external-SAE.diff
> >>>>
> >>>> These are what I understand are the '3 other patches'
> >>>> RFT-v2-1-3-wifi-brcmfmac-support-per-vendor-cfg80211-callbacks-and-
> >>>> firmware-events.patch.diff
> >>>> RFT-v2-2-3-wifi-brcmfmac-make-per-vendor-event-map-const.patch.diff
> >>>> RFT-v2-3-3-wifi-brcmfmac-cyw-support-external-SAE-authentication-in-
> >>>> station-mode.patch.diff
> >>>>
> >>>> If they are not correct could you send me links to them and I'll try
> >>>> again.
> >>>
> >>> You got it right. Kuddos.
> >>
> >> Ignored my spelling checker, but apparently it should be "kudos".
> >> Another lesson learned today.
> >>
> >> Regards,
> >> Arend
> > Arend,
> >
> > Thanks for the confirmation. My attempt at a hand edit to apply the
> > rejected portions resulted in a failed build with the current RPiOS
> > kernel in the git repo:
> > # uname -a
> > Linux jackrune 6.6.64-v8+ #6 SMP PREEMPT Sun Dec 15 23:55:30 CST 2024
> > aarch64 GNU/Linux
> >
> > When I try to apply them, I get this:
> > $ patch -Np1 -i
> > RFT-v2-1-3-wifi-brcmfmac-support-per-vendor-cfg80211-callbacks-and-firm=
ware-events.patch.diff
> > patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211=
.c
> > Hunk #1 FAILED at 6752.
> > 1 out of 1 hunk FAILED -- saving rejects to file
> > drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c.rej
> > patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
> > Hunk #1 succeeded at 524 (offset 33 lines).
> > patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
> > Hunk #1 FAILED at 1359.
> > 1 out of 1 hunk FAILED -- saving rejects to file
> > drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c.rej
> > patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c
> > Hunk #1 succeeded at 74 (offset -1 lines).
> > Hunk #2 succeeded at 336 (offset -70 lines).
> > patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvid.h
> > Hunk #1 FAILED at 15.
> > Hunk #2 succeeded at 47 with fuzz 1 (offset -9 lines).
> > 1 out of 2 hunks FAILED -- saving rejects to file
> > drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvid.h.rej
> > $ patch -Np1 -i RFT-v2-
> > RFT-v2-1-3-wifi-brcmfmac-support-per-vendor-cfg80211-callbacks-and-firm=
ware-events.patch.diff
> > RFT-v2-2-3-wifi-brcmfmac-make-per-vendor-event-map-const.patch.diff
> > RFT-v2-3-3-wifi-brcmfmac-cyw-support-external-SAE-authentication-in-sta=
tion-mode.patch.diff
> > $ patch -Np1 -i
> > RFT-v2-2-3-wifi-brcmfmac-make-per-vendor-event-map-const.patch.diff
> > patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h
> > Hunk #1 FAILED at 337.
> > 1 out of 1 hunk FAILED -- saving rejects to file
> > drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h.rej
> > $ patch -Np1 -i
> > RFT-v2-3-3-wifi-brcmfmac-cyw-support-external-SAE-authentication-in-sta=
tion-mode.patch.diff
> > patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211=
.c
> > Hunk #1 succeeded at 75 (offset 1 line).
> > Hunk #2 FAILED at 1940.
> > Hunk #3 FAILED at 2158.
> > Hunk #4 FAILED at 2216.
> > Hunk #5 succeeded at 5522 (offset 22 lines).
> > Hunk #6 succeeded at 5697 (offset 90 lines).
> > Hunk #7 succeeded at 6126 (offset 125 lines).
> > Hunk #8 succeeded at 7596 with fuzz 1 (offset 255 lines).
> > Hunk #9 FAILED at 7647.
> > 4 out of 9 hunks FAILED -- saving rejects to file
> > drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c.rej
> > patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211=
.h
> > Hunk #3 succeeded at 243 (offset 15 lines).
> > Hunk #4 FAILED at 244.
> > Hunk #5 succeeded at 507 (offset 18 lines).
> > 1 out of 5 hunks FAILED -- saving rejects to file
> > drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.h.rej
> > patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core=
.c
> > Hunk #1 FAILED at 8.
> > Hunk #2 FAILED at 39.
> > Hunk #3 FAILED at 49.
> > 3 out of 3 hunks FAILED -- saving rejects to file
> > drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c.rej
> > patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil=
_types.h
> > patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.=
c
> > Hunk #1 FAILED at 42.
> > 1 out of 1 hunk FAILED -- saving rejects to file
> > drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c.rej
> > patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.=
h
> > Hunk #1 succeeded at 32 with fuzz 2 (offset 1 line).
> > Hunk #2 succeeded at 60 with fuzz 1 (offset 2 lines).
> > patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c
> > Hunk #1 FAILED at 450.
> > 1 out of 1 hunk FAILED -- saving rejects to file
> > drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c.rej
> > patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h
> > Hunk #1 FAILED at 94.
> > 1 out of 1 hunk FAILED -- saving rejects to file
> > drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h.rej
> > patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvid.h
> > Hunk #1 FAILED at 15.
> > Hunk #2 succeeded at 47 with fuzz 1 (offset -11 lines).
> > 1 out of 2 hunks FAILED -- saving rejects to file
> > drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvid.h.rej
> > $ patch -Np1 -i RFT-brcmfmac-Fix-structure-size-for-WPA3-external-SAE.d=
iff
> > patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil=
_types.h
> >
> > Is there another missing patch?
> >
> > The kernel for the RPi is at this commit:
> > commit 80533a952218696c0ef1b346bab50dc401e6b74c (HEAD -> rpi-6.6.y,
> > origin/rpi-6.6.y, origin/HEAD)
>
> Sorry. I probably missed something, but earlier you had a log where the
> ext_auth exchange between iwd and brcmfmac almost worked, but firmware
> return BCME_BADLEN. What code base was that tested with. I assumed with
> my 3 patches, but now I am confused.
>
> Regards,
> Arend

Arend,

Sorry for the confusion. That was with the Basic/Standard kernel as it
existed at the time. 6.6.63 or so. No patches added.

Keith
