Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8FA623
	for <brcm80211@lists.linux.dev>; Wed,  5 Feb 2025 12:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759809; cv=none; b=SdF+KWS23fEioyyVckEXYI+iInuNKBgys/osI7E73Khz72NqC1In+MrZCyVJeI0e70HuwOYw+h+5ohLuSvNK7yew8iogWEDmUeVPhvERY2SMv8KcGD5a9oaUrFsqKeZvqk835BwnhbI+IaD9ivws80vBCN6gc5q+BEY4KWlcLfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759809; c=relaxed/simple;
	bh=j4zzZ5Fd//eJeb98Bc5OBFYHkzV8kjFJ4iK6bNQs4Ek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tIZrQpBspTUoWcP4VvdP6mvJ7yYUPMbYle2LVDucEa6KvIbqS/BBSn+RVRaIJ4K4wjx7MdMR3hVVv95rrb/5HebzLqII/B8nuw7vEuZpWCddh35S5sB4/UjjzZyBOGYbFntz5dwjHBObGDC1Girmx6QFl8OgOs64QYZ3ucOwyEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VC6rimvG; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VC6rimvG"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e545c1e8a15so6065514276.1
        for <brcm80211@lists.linux.dev>; Wed, 05 Feb 2025 04:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738759805; x=1739364605; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7epwpxk3DCDBPeOJ9vNMt883qQlGFfauH1LOAGxgT8c=;
        b=VC6rimvGkh9lT2B71ERZPvyTpzpc93v7+UTEbzGgxGl9FVqSnm7i+L0taiWFSnJ7PC
         ZdNJIBPKnEQaEYY5xqSXlr5NBi4tFNmXNv5uw1cYeW6caq0HWnjmrxP6M107/jq1m5qp
         YzYcHTt2UIWhYDoVrprjV7bmeKTs4Ts8HEHY7p9JP2/1Iz5eRcM4d+GEImbluMdq/1dN
         6sOP8tOp9yuuQnerhiitSK9IgabO914ELJj+duyqzoqvPPSktX433Zy61kAx9+HdOL7D
         n8jK53noIDkTndbkuEMufV5zv6tf5DVpCBMoBpEnAGHcaIgg77kQyrOHFoX3H1eZ+yEa
         TZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759805; x=1739364605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7epwpxk3DCDBPeOJ9vNMt883qQlGFfauH1LOAGxgT8c=;
        b=P+k/4StAr01Qau+JnpNbQh9JdhBkjCeFYMhjN4o7Q0n3/TfH9tEulEY0hPuhjdTx4t
         gnsDws0B3GC9STnG5ea6havF8FDdkK/qZgkDIgs9lZyYHBBdCKQbVPIApkmN8edTDjXh
         B8AS/RpCOhYnJiLQeHJByJYaD2P6AZdJq/0luZxWwtrSosztY6sT+JCmwdMBNIJtsVVC
         FeNOiVLSEdaoYFcS+Qj+hMPIpi2tolpDQty2g4oGy3XJ7vv4hYXZQIXmjGgJHPtG16hb
         1QPRULIwzbW7EOUQyFeeqKyKj+lFngJUWePCFPSOLT6IA9y63OaLouAG+xnOiHzmiWau
         oCnw==
X-Forwarded-Encrypted: i=1; AJvYcCVPxMhwVoYCBeVp3Ecl+7sr+u5A/6GoGYFDUwOIdVaZd1/dPmmyDGgcjs27PqfyfAa+OkIv1fXkqn4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZvOfbbZ5F7/h96djq2W83WDOzq4LrlPYaaP4xXmQ2fnzOPSD2
	75yrsOhw1WgpiTQt1efdXuLa92dyAIRCuS0tO+tejCDJs+yJxxUAqMrghCrEZZn/BwshC1/o0UJ
	siO86dGbVbe4pNRpWF+Vc1dQuHuos6oSYRKY8vw==
X-Gm-Gg: ASbGncvCx6gfVsxQZGXCSE0x75tNv9UL09pxolnt5tnbdVr0Y6bnRqG/f2/JTti3Mwx
	SMwU0LqGwMF7rUCDYrfC8WxsIxMj3L5X2GLCGg8drMqG+DvkQAdXqupszwMaCIbPCSzrr5HZXAQ
	==
X-Google-Smtp-Source: AGHT+IGNEMpFpwIDEvjKRd982v0sZvCE7qqxjrLmWh+ix3nmZFTR/SvAtUaUa50P7DgN0c/lEeYEv+0tofHLf3fnDcQ=
X-Received: by 2002:a05:6902:218d:b0:e5a:e88e:b2d5 with SMTP id
 3f1490d57ef6-e5b259cc676mr1893993276.9.1738759805421; Wed, 05 Feb 2025
 04:50:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cd1b13d4-b01d-4237-813e-bd48c55d9ca9@matthias-proske.de>
 <CAPDyKFr=XyLg2VjuEq1ZTrdAwSJJmYFDn9wSFj4zWD1+ZB9MTQ@mail.gmail.com> <6aa67bad-5712-441e-a24b-f787474472bb@matthias-proske.de>
In-Reply-To: <6aa67bad-5712-441e-a24b-f787474472bb@matthias-proske.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 5 Feb 2025 13:49:29 +0100
X-Gm-Features: AWEUYZlHrK39f1YsXoPfErS5ctLPHUCGKTTIr9iDD9WJoAxnpsVTB1gUSLbSpiI
Message-ID: <CAPDyKFooyDSPu7RG18sp9cV1ndRPpg5yia1BAiqtb-c3cOqv5Q@mail.gmail.com>
Subject: Re: DT property keep-power-in-suspend and how WiFi drivers use it
To: Matthias Proske <email@matthias-proske.de>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Feb 2025 at 17:25, Matthias Proske <email@matthias-proske.de> wrote:
>
> On 2/4/25 4:26 PM, Ulf Hansson wrote:
> > On Wed, 29 Jan 2025 at 12:05, Matthias Proske <email@matthias-proske.de> wrote:
> >>
> >> Hello,
> >>
> >> I have a question regarding the usage of the Device Tree property
> >> `keep-power-suspend`.
> >>
> >> In the Device Tree documentation it reads:
> >> "SDIO only. Preserves card power during a suspend/resume cycle."
> >>
> >> Does that mean that the SDIO Host Controller will remain powered or
> >> should this equally apply to anything that is connected to this SDIO
> >> Host Controller?
> >
> > Unfortunately the documentation isn't really clear.
> > "keep-power-in-suspend" means that the platform is *capable* of
> > keeping the SDIO card powered when the system is suspended.
> >
> > Depending on what the SDIO func-driver (like the brcm_fmac driver)
> > decides to do during system suspend/resume, the mmc core we may or may
> > not keep the SDIO card powered.
> >
> >>
> >> To give a bit more background:
> >>
> >> I have an embedded board with a brcm_fmac WiFi module. It seems that due
> >> to a hardware limitation we are not permitted to switch the module off.
> >> It simply cannot be re-probed afterwards.
> >
> > How did we manage to power it on and probe it in the first place?
>
> Sorry if this was misleading. By "we" I meant whoever uses our hardware.
> I probably should have written "I" instead.
>
> I have a hardware with the limitation that I can only power off WiFi
> whenever I power off the complete SoC.
>
> Was it fixed it in newer HW designs? Yes.
> Is there HW out there with the problem? Also yes.
>
> How could I probe it in the first place?
> The brcm_fmac module was responding because it was still in its initial
> phase after being booted.
>
> >
> >>
> >> The property `keep-power-in-suspend` was used and that used to work fine
> >> until 92caded ("brcmfmac: Avoid keeping power to SDIO card
> >> unless WOWL is used"), which made the wifi adapter by default turn off
> >> on suspend to be re-probed on resume. Not working on our board...
> >
> > Would you mind elaborating why it isn't working?
>
> I can no longer probe the device after the resume.
>
> [   61.390016] brcmfmac: brcmf_sdio_bus_rxctl: resumed on timeout
> [   61.390128] ieee80211 phy1: brcmf_bus_started: failed: -110
> [   61.390294] ieee80211 phy1: brcmf_attach: dongle is not responding:
> err=-110
> [   61.426594] brcmfmac: brcmf_sdio_firmware_callback: brcmf_attach failed

I had a look at the corresponding code in
drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c. Yes, it
seems there is a complete cleanup and re-probe being done during
system suspend/resume (it looks heavy and prone to errors, but that's
a different story).

Anyway, it would also be interesting to know if the SDIO
card/interface is failing to be re-initialized correctly by the mmc
core during system resume. Typically, mmc_sdio_resume() in
drivers/mmc/core/sdio.c should not return an error code, but it sounds
like that is the case too, right?

>
> I assume that I have this problem because I cannot power off the WiFi
> module using the two GPIOs, usually controlled by a mmc-pwrseq. In fact
> I don't see these errors with the newer HW revisions where I can toggle
> the GPIOs.

With HW revisions, are you referring to different platform revisions
or revisions of the WiFi module? Or both?

Anyway, in the past we have seen many issues with incorrect HW
descriptions in DT in regards to the mmc-pwrseq. The mmc-pwrseq may be
different both from the platform point of view and from the WiFi
module point of view.

For example, maybe those GPIOs were routed differently on some
platforms, but not correctly described in DT? Or perhaps different
variants of the WiFi module need different power-sequences?

Just wanted to be sure that we really have a broken HW and not just
the description of it. :-)

>
>
> >
> >>
> >>
> >> I have also looked at other WiFi drivers with an SDIO interface and it
> >> seems that none of them are really honoring the `keep-power-in-suspend`
> >> flag. Is this flag for the SDIO Host Controller only?
> >
> > See above.
> >
> >>
> >>
> >> What would be proper way to implement it so that the brcm_fmac return to
> >> its old behaviour if necessary?
> >> Add a Device Tree property directly for the brcm_fmac driver..?
> >
> > The corresponding SDIO func-driver may call
> > sdio_set_host_pm_flags(func, MMC_PM_KEEP_POWER). In this way, the mmc
> > core will leave the SDIO card powered-on during system suspend.
> > Although, unless it's really necessary, it's ofcourse a bad idea as it
> > would mean wasting energy when the system is suspended.
>
> Just to get my understanding right: The brcm_fmac driver would be the
> SDIO func-driver in my case, right?

Correct. The one that is registered with sdio_register_driver().

>
> Thanks for the feedback

Np, I am happy to help!

>
> Matthias
>

Kind regards
Uffe
