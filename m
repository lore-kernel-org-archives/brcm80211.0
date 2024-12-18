Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E345217C219
	for <brcm80211@lists.linux.dev>; Wed, 18 Dec 2024 14:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734531034; cv=none; b=GYtNLouEJuTuoqIOs0XBbMvW32PonOTORseNzsLM7o5SaxhDrxqhXNPHO5x9bPkDy0PBR7nRZa9PI0K1T4/XAzTQh9uXD4MfrdNkB33K4ihMm87r6K38g/JUDzuV8RiL3D2QnLwXkdQ+8LkkOsPBTioQyP1CQPDqRgbktJW3tMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734531034; c=relaxed/simple;
	bh=14Q9WCOBFbmFhxVTtjhhArQv7/nz7wdpWxVl8/wu8Vk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZYsapjFWujuy8ab3uJzpHSoGcpDLSSIRRUXDqn2NR1XGOIWwetGAZOVpCB0RSZvChVlX/S67I3LITooPXwEmvWts45r9yavg3iWOtGBJEhCx2ldkGYm9v695DmIRZ05o76fsmDl5Yg5RgImhEv6effKs3+g5Pe6iB+rBAG51lMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NlbRTcdE; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlbRTcdE"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ef28f07dbaso4539195a91.2
        for <brcm80211@lists.linux.dev>; Wed, 18 Dec 2024 06:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734531032; x=1735135832; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14Q9WCOBFbmFhxVTtjhhArQv7/nz7wdpWxVl8/wu8Vk=;
        b=NlbRTcdEDPMCqMbqmGMZqZ6Xv17cBkKOhOrTuEupqKcpaTFhXsQY5ZfbYLzSyldQlO
         45PNozrFKuiKoWNSHuX0PgaJfxWSOQKHyyc9pyIpX8VMTerF1n3t2njKG1fdGd2CYEhQ
         rCb5LVquQ0VZAN+sf2vQr5A4BzXXZD4nToMyHNmKsqRJQKdvaJnSktfT3BzqDlshtFVh
         CP9zvm2jxxL7WJGLbfGS9Da+6fnHfsKk4PKiAcRmZNaZQKsgN5Lk7dTGKH4qLLqMKUui
         ALp8cbMlhS3UZgAMqHLbXxf3lI4wcCRdwgF1qeFbhE+IkMv1Yli095lAOCsee4QLi8g2
         v5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734531032; x=1735135832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14Q9WCOBFbmFhxVTtjhhArQv7/nz7wdpWxVl8/wu8Vk=;
        b=AnnZrwoaCXrG/As51CCVbqw7b79+bAbW40r2pGTunG/fnIjmMkVOQKMxlt4zMYF2RW
         EdqYRdgU8wDUmUXgRy7wmSJ8D0HNB/ZbSONP6tJ7uy9O6AMzWKEplfIDMKNwZOq+da9x
         ZeIR1CACwBeGOPUAI7v7YZenzv9HaKpvk3BzXObDXYP3pnxAGSDpDZulTEXJQdH74l9E
         QUretfxO911+AE7gUZMbnldfBVb9s94Pbw43n5gtsFmNDi2/fI22GJHF4Ym/MEsxDutL
         3m6vgwELhGkaiCyoJmuOe66TboXxEzMQfD7OGU3tMSngV6H1JttEAlnt9w4sCTnGeAWH
         WdWQ==
X-Gm-Message-State: AOJu0Yw/SdCX0qxdnTI72DPJNAOvN07qOsLxrNN2yUFk28XAz3ujLBPs
	/nqD9xUDa3LM6ow1CntUUMouKqY6eC11dEI5Pi+f+qJgzXOacpk/zTqjQXKYaNnGoKF4OF0AxYg
	On46nXPDBl6aYPwIfjGl+TcQdHbYFlPYN
X-Gm-Gg: ASbGnctdDnhKqJk2vptMG7xsw909cugI1CMjgxJdsQDWrSO5rg8ymsiL9YcfBfth2ab
	u1yoMxw5PLrJL0Hpv6mXJ81TmeLRG5EMRmWTjQo0R
X-Google-Smtp-Source: AGHT+IG9io9hkvehRa6gmf2WWGwYctYC1nLovNc7kRvi5Or8NU+NRZg678cMk1v/Plr7M4tqhqcwggQ8aEfpHdUqjpk=
X-Received: by 2002:a17:90b:2d4c:b0:2ee:8439:dc8 with SMTP id
 98e67ed59e1d1-2f2e93792dbmr4021897a91.34.1734531030987; Wed, 18 Dec 2024
 06:10:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAG17S_OwtNxetb7XzsxkZcygH_CWkZx15evQZkThb3WjqpiKTQ@mail.gmail.com>
 <193c1173968.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CAG17S_NwSKEJzbk7RNiOKqU_25f6muydbh0DN+ec1Ke6QrR1Qw@mail.gmail.com>
 <CAG17S_NqbLogvTWyoYobZ6kOpfXHnScfm4-dB1EqsmpB+q+zxA@mail.gmail.com>
 <21a81894-2e1e-440b-b7ea-27660fa08d9d@broadcom.com> <CAG17S_O5K4Uh2c6xqph5sUZe8gMjhD3z4FDkSSQ0dhCuZA6aug@mail.gmail.com>
 <193cb61e210.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CAG17S_P+cOQMpQda00JTCCKEB6MpPE4X2i8mRrEaM-n5YKdpNg@mail.gmail.com>
 <14ec6009-7b91-4a25-9943-f63da91d8c41@broadcom.com> <caa186d8-1e07-421d-a127-7bb6482ac704@broadcom.com>
 <CAG17S_N0V=_Es0C7wA3fPu2MrBKBM7tEHRXOnVGWiUSxPucaRQ@mail.gmail.com>
 <ec23f0d9-a23c-4684-b0b6-a89141c5ec37@broadcom.com> <CAG17S_PmXNP2bdUU5ErQd-N2jyScqvfKTFsnWgADb3uhqpBsZA@mail.gmail.com>
 <65e4975d-2234-44d6-bdd0-a679df2b1c66@broadcom.com> <CAG17S_OAPEWsr61cBA1qfNhFst-mYK5a2_VrCZVZhdd-KVM9cw@mail.gmail.com>
 <c6e8ab71-d1e3-41a1-925c-9013f5a87f12@broadcom.com>
In-Reply-To: <c6e8ab71-d1e3-41a1-925c-9013f5a87f12@broadcom.com>
From: KeithG <ys3al35l@gmail.com>
Date: Wed, 18 Dec 2024 08:10:20 -0600
Message-ID: <CAG17S_MoZDbu1vSt+=80xs+Cje_PPFhFwPxmWDUeNPJ9qRZ6bw@mail.gmail.com>
Subject: Re: brcmfmac SAE/WPA3 negotiation
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: brcm80211@lists.linux.dev, linux-wireless@vger.kernel.org, 
	Denis Kenzior <denkenz@gmail.com>, James Prestwood <prestwoj@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 4:21=E2=80=AFAM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On 12/18/2024 1:21 AM, KeithG wrote:
> > On Tue, Dec 17, 2024 at 7:47=E2=80=AFAM Arend van Spriel
> > <arend.vanspriel@broadcom.com> wrote:
> >>
> >>
> >>
> >> On 12/17/2024 1:13 AM, KeithG wrote:
> >>> On Mon, Dec 16, 2024 at 1:50=E2=80=AFPM Arend van Spriel
> >>> <arend.vanspriel@broadcom.com> wrote:
> >>>>
> >>>> On 12/16/2024 1:21 PM, KeithG wrote:
> >>>>> On Mon, Dec 16, 2024 at 3:47=E2=80=AFAM Arend van Spriel
> >>>>> <arend.vanspriel@broadcom.com> wrote:
> >>>>>>
> >>>>>> On 12/16/2024 10:43 AM, Arend van Spriel wrote:
> >>>>>>> On 12/16/2024 1:17 AM, KeithG wrote:
> >>>>>>>> On Sun, Dec 15, 2024 at 11:33=E2=80=AFAM Arend Van Spriel
> >>>>>>>> <arend.vanspriel@broadcom.com> wrote:
> >>>>>>>>>
> >>>>>>>>> On December 15, 2024 5:08:12 PM KeithG <ys3al35l@gmail.com> wro=
te:
> >>>>>>>>>
> >>>>>>>>>> On Sun, Dec 15, 2024 at 6:12=E2=80=AFAM Arend van Spriel
> >>>>>>>>>> <arend.vanspriel@broadcom.com> wrote:
> >>>>>>>>>>>
> >>>>>>>>>>> On 12/14/2024 2:34 PM, KeithG wrote:
> >>>>>>>>>>>> Arend,
> >>>>>>>>>>>>
> >>>>>>>>>>>> I looked through the info where I got the latest firmware:
> >>>>>>>>>>>> https://community.infineon.com/t5/Wi-Fi-Bluetooth-for-Linux/=
Wi-Fi-
> >>>>>>>>>>>> A-class-Linux-Driver-release-FMAC-2024-11-21-Documents/td-p/=
905045
> >>>>>>>>>>>> https://community.infineon.com/t5/AIROC-Wi-Fi-and-Wi-Fi-Blue=
tooth/
> >>>>>>>>>>>> Cypress-Linux-WiFi-Driver-Release-FMAC-2024-11-21/td-p/90288=
8
> >>>>>>>>>>>> and did not find anything, but I really do not know what I a=
m
> >>>>>>>>>>>> looking for.
> >>>>>>>>>>>
> >>>>>>>>>>> I think I had a bit more luck and maybe found the needle. I s=
ent out
> >>>>>>>>>>> another RFT patch which hopefully gets rid of the BCME_BADLEN=
 error.
> >>>>>>>>>>>
> >>>>>>>>>>> Regards,
> >>>>>>>>>>> Arend
> >>>>>>>>>> Arend,
> >>>>>>>>>>
> >>>>>>>>>> Can you send me a link to that patch? I want to try it.
> >>>>>>>>>
> >>>>>>>>> Hmm. I explicitly sent it to you, but here is a link to patchwo=
rk:
> >>>>>>>>>
> >>>>>>>>> https://patchwork.kernel.org/project/linux-wireless/
> >>>>>>>>> patch/20241215120401.238320-1-arend.vanspriel@broadcom.com/
> >>>>>>>>>
> >>>>>>>>> You can apply it on top of the other 3 patches.
> >>>>>>>>>
> >>>>>>>>> Regards,
> >>>>>>>>> Arend
> >>>>>>>>>
> >>>>>>>> Thanks! I got it.
> >>>>>>>> I am building now and have tried to apply what I think are the c=
orrect
> >>>>>>>> patches. They do not apply cleanly and I had to hand edit things=
. My
> >>>>>>>> guess is I messed something up.
> >>>>>>>> I will see what happens when I reboot. It'll take a few hours to=
 build
> >>>>>>>> on my Pi4 then for me to install it on the 3b+ to test.
> >>>>>>>>
> >>>>>>>> I hope I understand which are the '3 other' patches.
> >>>>>>>>
> >>>>>>>> This is the one I got from your link:
> >>>>>>>> RFT-brcmfmac-Fix-structure-size-for-WPA3-external-SAE.diff
> >>>>>>>>
> >>>>>>>> These are what I understand are the '3 other patches'
> >>>>>>>> RFT-v2-1-3-wifi-brcmfmac-support-per-vendor-cfg80211-callbacks-a=
nd-
> >>>>>>>> firmware-events.patch.diff
> >>>>>>>> RFT-v2-2-3-wifi-brcmfmac-make-per-vendor-event-map-const.patch.d=
iff
> >>>>>>>> RFT-v2-3-3-wifi-brcmfmac-cyw-support-external-SAE-authentication=
-in-
> >>>>>>>> station-mode.patch.diff
> >>>>>>>>
> >>>>>>>> If they are not correct could you send me links to them and I'll=
 try
> >>>>>>>> again.
> >>>>>>>
> >>>>>>> You got it right. Kuddos.
> >>>>>>
> >>>>>> Ignored my spelling checker, but apparently it should be "kudos".
> >>>>>> Another lesson learned today.
> >>>>>>
> >>>>>> Regards,
> >>>>>> Arend
> >>>>> Arend,
> >>>>>
> >>>>> Thanks for the confirmation. My attempt at a hand edit to apply the
> >>>>> rejected portions resulted in a failed build with the current RPiOS
> >>>>> kernel in the git repo:
> >>>>> # uname -a
> >>>>> Linux jackrune 6.6.64-v8+ #6 SMP PREEMPT Sun Dec 15 23:55:30 CST 20=
24
> >>>>> aarch64 GNU/Linux
> >>>>>
> >>>>> When I try to apply them, I get this:
> >>>>> $ patch -Np1 -i
> >>>>> RFT-v2-1-3-wifi-brcmfmac-support-per-vendor-cfg80211-callbacks-and-=
firmware-events.patch.diff
> >>>>> patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg8=
0211.c
> >>>>> Hunk #1 FAILED at 6752.
> >>>>> 1 out of 1 hunk FAILED -- saving rejects to file
> >>>>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c.rej
> >>>>> patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/comm=
on.c
> >>>>> Hunk #1 succeeded at 524 (offset 33 lines).
> >>>>> patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/core=
.c
> >>>>> Hunk #1 FAILED at 1359.
> >>>>> 1 out of 1 hunk FAILED -- saving rejects to file
> >>>>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c.rej
> >>>>> patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh=
.c
> >>>>> Hunk #1 succeeded at 74 (offset -1 lines).
> >>>>> Hunk #2 succeeded at 336 (offset -70 lines).
> >>>>> patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvi=
d.h
> >>>>> Hunk #1 FAILED at 15.
> >>>>> Hunk #2 succeeded at 47 with fuzz 1 (offset -9 lines).
> >>>>> 1 out of 2 hunks FAILED -- saving rejects to file
> >>>>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvid.h.rej
> >>>>> $ patch -Np1 -i RFT-v2-
> >>>>> RFT-v2-1-3-wifi-brcmfmac-support-per-vendor-cfg80211-callbacks-and-=
firmware-events.patch.diff
> >>>>> RFT-v2-2-3-wifi-brcmfmac-make-per-vendor-event-map-const.patch.diff
> >>>>> RFT-v2-3-3-wifi-brcmfmac-cyw-support-external-SAE-authentication-in=
-station-mode.patch.diff
> >>>>> $ patch -Np1 -i
> >>>>> RFT-v2-2-3-wifi-brcmfmac-make-per-vendor-event-map-const.patch.diff
> >>>>> patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh=
.h
> >>>>> Hunk #1 FAILED at 337.
> >>>>> 1 out of 1 hunk FAILED -- saving rejects to file
> >>>>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h.rej
> >>>>> $ patch -Np1 -i
> >>>>> RFT-v2-3-3-wifi-brcmfmac-cyw-support-external-SAE-authentication-in=
-station-mode.patch.diff
> >>>>> patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg8=
0211.c
> >>>>> Hunk #1 succeeded at 75 (offset 1 line).
> >>>>> Hunk #2 FAILED at 1940.
> >>>>> Hunk #3 FAILED at 2158.
> >>>>> Hunk #4 FAILED at 2216.
> >>>>> Hunk #5 succeeded at 5522 (offset 22 lines).
> >>>>> Hunk #6 succeeded at 5697 (offset 90 lines).
> >>>>> Hunk #7 succeeded at 6126 (offset 125 lines).
> >>>>> Hunk #8 succeeded at 7596 with fuzz 1 (offset 255 lines).
> >>>>> Hunk #9 FAILED at 7647.
> >>>>> 4 out of 9 hunks FAILED -- saving rejects to file
> >>>>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c.rej
> >>>>> patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg8=
0211.h
> >>>>> Hunk #3 succeeded at 243 (offset 15 lines).
> >>>>> Hunk #4 FAILED at 244.
> >>>>> Hunk #5 succeeded at 507 (offset 18 lines).
> >>>>> 1 out of 5 hunks FAILED -- saving rejects to file
> >>>>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.h.rej
> >>>>> patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/=
core.c
> >>>>> Hunk #1 FAILED at 8.
> >>>>> Hunk #2 FAILED at 39.
> >>>>> Hunk #3 FAILED at 49.
> >>>>> 3 out of 3 hunks FAILED -- saving rejects to file
> >>>>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c.rej
> >>>>> patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/=
fwil_types.h
> >>>>> patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/feat=
ure.c
> >>>>> Hunk #1 FAILED at 42.
> >>>>> 1 out of 1 hunk FAILED -- saving rejects to file
> >>>>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c.rej
> >>>>> patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/feat=
ure.h
> >>>>> Hunk #1 succeeded at 32 with fuzz 2 (offset 1 line).
> >>>>> Hunk #2 succeeded at 60 with fuzz 1 (offset 2 lines).
> >>>>> patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh=
.c
> >>>>> Hunk #1 FAILED at 450.
> >>>>> 1 out of 1 hunk FAILED -- saving rejects to file
> >>>>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c.rej
> >>>>> patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh=
.h
> >>>>> Hunk #1 FAILED at 94.
> >>>>> 1 out of 1 hunk FAILED -- saving rejects to file
> >>>>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h.rej
> >>>>> patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvi=
d.h
> >>>>> Hunk #1 FAILED at 15.
> >>>>> Hunk #2 succeeded at 47 with fuzz 1 (offset -11 lines).
> >>>>> 1 out of 2 hunks FAILED -- saving rejects to file
> >>>>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvid.h.r
> >>>>> $ patch -Np1 -i RFT-brcmfmac-Fix-structure-size-for-WPA3-external-S=
AE.diff
> >>>>> patching file drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/=
fwil_types.h
> >>>>>
> >>>>> Is there another missing patch?
> >>>>>
> >>>>> The kernel for the RPi is at this commit:
> >>>>> commit 80533a952218696c0ef1b346bab50dc401e6b74c (HEAD -> rpi-6.6.y,
> >>>>> origin/rpi-6.6.y, origin/HEAD)
> >>
> >> So what repository does origin refer to. Can you share the URL?
> >>
> >> I will check if I posted any patches between 6.6 and 6.10+ Get back to
> >> this later o
> >>
> >> Regards,
> >> Arend
> >
> > Arend,
> >
> > I am using the RaspberryPi repo:
> > https://github.com/raspberrypi/linux
>
> I was afraid you would say that. So we need to determine what brcmfmac
> patches are in there compared to upstream kernel. So checking the code I
> think you should apply only the "Fix-structure-size" patch to
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h. Let me
> know if that works for you.
>
> Gr. AvS
Arend,

That patch applied to the file in the folder you suggested. I am
building a kernel now and will see any changes this evening. Thanks
for the help.

Regards,

Keith
