Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A86221543
	for <brcm80211@lists.linux.dev>; Mon,  6 Oct 2025 17:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759770510; cv=none; b=WddxSmgKfPs4SQfyR/1lAR2QvawveMJgp+sQy+R4paprSUJUUnDWnMAbNi2BAkP9rNdvNcfFUK4s89Ahpy2bI6A8U6+Lt8bE1Z0La6v/XEQfC0blXfYP2D/AB9nIyi0cycRrShsPXjWaVWhPAoIWTMU5o8vXP0LrwydUL+PafjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759770510; c=relaxed/simple;
	bh=LPfq4U82XXoYU9A5D1nK1Jhh2kciTHvkTM4GcmcSSvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WCu2UzH4i8yZ61wn9LqOkGMgfMu1FO0wAEAFr59oLde/s90Bpct3pJZKdXo0MCPhByv+BwnJqgzmyQDKA+dHoiupBXFi7zjfuccM9h6FnlM0jZyhfljsLphNrK/VzmxOELhvyapyyDoL9qd5rrm63E2mRAzUQ42kVXsz6pdAMDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=govivid.ai; spf=pass smtp.mailfrom=govivid.ai; dkim=pass (2048-bit key) header.d=govivid-ai.20230601.gappssmtp.com header.i=@govivid-ai.20230601.gappssmtp.com header.b=TnldK+LH; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=govivid.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=govivid.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=govivid-ai.20230601.gappssmtp.com header.i=@govivid-ai.20230601.gappssmtp.com header.b="TnldK+LH"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-79ad9aa2d95so63593836d6.1
        for <brcm80211@lists.linux.dev>; Mon, 06 Oct 2025 10:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=govivid-ai.20230601.gappssmtp.com; s=20230601; t=1759770506; x=1760375306; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B80olGo7V8PAVZoOCsY/kEK3EwMmaT8KEM2n2VEV6PY=;
        b=TnldK+LH7xPSRGD4X0HyiBL6ZHrGvXTKuuSei6Vplwk/oJs1jRH3CrCTTNphgP+sJS
         eCCOvCwBF3/ixHiAv/F8oBQoQurCYP74GJ5fc3SPDqjTJPQ0UMzCcTfPZnB+1zm4841B
         l3OyG7eOqqFPd+w7MLQKok+CZR8Qs7xVjESO0mLXydRPEUdrLk373mv6B5FAGtBmh9+e
         Xy6jY1pYKSqHt709wRXLa1hw6cbGoJeuZuW/2J08IL/M0eNiBzoIy3o6vykqVBD0/dv/
         sCsyzoi4/dGiRAD0gkQ4IerdmmrqWB6WwMBJqyohXiP1oaO4GqbWu51imMa8V/2/LsGp
         bBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759770506; x=1760375306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B80olGo7V8PAVZoOCsY/kEK3EwMmaT8KEM2n2VEV6PY=;
        b=liGAHf+Vjd0sRhgjAUMizHEzUExBP592kJmsRxoamN9fRMI+tQaramXZ+w7VxmBbR/
         32dsDAuafyW9g8gxt5HlF/+A3Ls87Dhv7BG6fJHtjSNky/xwPYi+hqht0a6AHgJwCMs0
         MZdhsWvoCPQFoBwd1YdinolQFIT7WfNcqS7wryHt3NSZpS16MysFikg1sF3fqhw90rW3
         2T9B3tbJLlTq2g/0HPGVktQvdaXBcXB3Z5W2yRpvoJ1mRXCJyOpwDTbktqlJ661VNZWy
         HoH1vLDPYYW34GFr/BVMa17eiAQ6dCPa9gHN9zYNxnTfz7oSjl5IePLPozqTgByK5aXP
         sRCg==
X-Forwarded-Encrypted: i=1; AJvYcCUvZz2G+Ap8cYta2gMTl8uoTqdI4k18srbW4c0lHmo1Zk/hs7h5PjcIDLil492rDeDEsU2j+xOSRgg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBYbkW8RSUhca2WwQbLXLMZwWW/yJhv4m9oiJZxDANktpNywGs
	4rP98360ULlhw1tBanydYwPbt9BSTDRldNBaJ/84nr2oBQGT5EOECMSn8XgDcP6c/ZOeFB2HUYg
	NAyCH86Ynt6P+k7+zqXmO4m92+fIJo59eoWIGhUXx/g==
X-Gm-Gg: ASbGnctCFxrjvAJr3yfSZrYh0jx+31La0fAdpi20zuZTzSNtCt3/T3SpjoBw6NdQDXF
	neSDCdMF9PD7oQAnSKt3eNrYv5krvuEY1D3FJ+38eR2ZTwpI3giWCtLUKEa4ArHzRdINVheAuR5
	j75UylNp9j1quHkVl4/JD4PxIRFMkAEcrCxhijapTPdiUJTZ60qzxCOcBvJ237x4qssqFlQJhb7
	EpQ7hAFaIroAW9EN7U6oxpNXSGOasVUIkFIv7E6
X-Google-Smtp-Source: AGHT+IEoVNWlBEybOWtlZ7FOae3aeEOebdtOGbgrwSy2plolnz7CqjmMItV3GWiqXcLaUQ75echVDB6w3IoMecznuWM=
X-Received: by 2002:a05:6214:258c:b0:777:4a0:9b1 with SMTP id
 6a1803df08f44-879dc861477mr188984026d6.55.1759770506227; Mon, 06 Oct 2025
 10:08:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <b2e0bf04-f149-4a23-aba5-cad55a8923c1@broadcom.com>
 <20251002232002.124609-1-richard@govivid.ai> <199aacd7e50.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <d1510cb6-a613-4e22-91aa-4fee1fdfa29b@gmx.net> <1bb08036-2569-454a-bd26-f1d713b4c299@broadcom.com>
 <f0352cba-0810-43c3-9c53-baa012f93513@gmx.net>
In-Reply-To: <f0352cba-0810-43c3-9c53-baa012f93513@gmx.net>
From: Richard Reigh <richard@govivid.ai>
Date: Mon, 6 Oct 2025 12:08:14 -0500
X-Gm-Features: AS18NWBlXHG_JoHopNTGi0I3pkA03gVQfLpwK50etOFcZkIHrMXh7jzgXNWlUho
Message-ID: <CAFwtOaWsS5U-gb3=DM0QZ6MuZgAHV-O-qLtC9-npQEjGsog1AA@mail.gmail.com>
Subject: Re: [PATCH] brcmfmac: Fix NULL pointer dereference in P2P action
 frame handling
To: Stefan Wahren <wahrenst@gmx.net>
Cc: brcm80211-dev-list.pdl@broadcom.com, brcm80211@lists.linux.dev, 
	linux-wireless@vger.kernel.org, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, chris@streetlogic.pro, s311332@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 10:47=E2=80=AFAM Stefan Wahren <wahrenst@gmx.net> wr=
ote:
>
> Hi Richard,
>
> Am 04.10.25 um 11:22 schrieb Arend van Spriel:
> > On 10/3/2025 7:02 PM, Stefan Wahren wrote:
> >> Hi,
> >>
> >> Am 03.10.25 um 18:00 schrieb Arend van Spriel:
> >>> Op 3 oktober 2025 01:20:21 schreef Richard Reigh <richard@govivid.ai>=
:
> >>>
> >>>> When iPhones query network information via the WiFi settings "i"
> >>>> button,
> >>>> the brcmfmac driver crashes with a NULL pointer dereference. This
> >>>> occurs
> >>>> because the P2P device vif is not initialized when handling certain
> >>>> action
> >>>> frames.
> >>>
> >>> That does make a lot more sense than the line that gdb gave me with
> >>> my driver rebuild attempt.
> >>>
> >>>> Add NULL check for vif before dereferencing in
> >>>> brcmf_p2p_tx_action_frame()
> >>>> and return -ENODEV when vif is NULL. Also modify
> >>>
> >>> Now I don't think it is necessary to bail out here. See my
> >>> suggestion below...
> >>>
> >>>> the retry loop in
> >>>> brcmf_p2p_send_action_frame() to stop immediately on permanent
> >>>> failures
> >>>> rather than retrying.
> >>>>
> >>>> Tested on Raspberry Pi Zero 2 W with kernel 6.1.21-v8+
> >>>>
> >>>> Signed-off-by: Richard Reigh <richard@govivid.ai>
> >>>> ---
> >>>> .../wireless/broadcom/brcm80211/brcmfmac/p2p.c   | 16 ++++++++++++++=
+-
> >>>> 1 file changed, 15 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
> >>>> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
> >>>> index 10d9d9c63..2c73156fa 100644
> >>>> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
> >>>> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
> >>>> @@ -1559,6 +1559,12 @@ static s32 brcmf_p2p_tx_action_frame(struct
> >>>> brcmf_p2p_info *p2p,
> >>>> else
> >>>> vif =3D p2p->bss_idx[P2PAPI_BSSCFG_DEVICE].vif;
> >>>>
> >>>> + /* add NULL check */
> >>>> + if (!vif) {
> >>>> + brcmf_err("vif is NULL, cannot send action frame\n");
> >>>> + return -ENODEV;
> >>>> + }
> >>>
> >>> Instead of giving up and surrender we can use primary vif, ie. p2p-
> >>> >bss_idx[P2PAPI_BSSCFG_PRIMARY].vif:
> >>>
> >>> if (!vif) {
> >>>        brcmf_dbg(TRACE, "no P2P device setup\n");
> >>>        vif =3D p2p->bss_idx[P2PAPI_BSSCFG_PRIMARY].vif;
> >>> }
> >> this looks much better. But the whole patch needs a fixes tag.
> >
> > Sure.
> >
> >> In case this issue is reproducible before Linux 5.8, the tag should
> >> reference:
> >> 18e2f61db3b7 ("brcmfmac: P2P action frame tx.")
> >>
> >> otherwise it should reference:
> >> d524d5ce3655 ("brcmfmac: p2p cert 6.1.9-support GOUT handling p2p
> >> presence request")
> >
> > Both good suggestions. Looking at the code I would say that
> > 18e2f61db3b7 ("brcmfmac: P2P action frame tx.") is the best choice.
> thanks. @Richard Do you plan to submit a V2 patch?
>
> Best regards
> >
> > Regards,
> > Arend

Stefan,

Yes, I plan on submitting a V2 patch, after I finish testing the change.

I will also add the suggested fixes tag to the patch submission.

Thanks,
Richard
