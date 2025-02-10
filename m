Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19811F78E4
	for <brcm80211@lists.linux.dev>; Mon, 10 Feb 2025 12:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739191680; cv=none; b=bfw6cwFK/NCo/7BrqVKEFjFcVPPlj048zyvN5vo1aDya8r/8GBWyeG+BhloZ87Ry595vxLVpOEgjLBKegFrCPTApA8joDuap3+irDz5kQoEUXUgXCuVJzqV4Bc99qjkJ4oVvMRGmphERiDDpdbkPhEGjf3Q7sxH6U66QjzSozfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739191680; c=relaxed/simple;
	bh=sw4GIsTupaH+lw8i0Nwr5L7XDu0thVQ7gAEmZQ0sbUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R+PHKVgKmXgByDfdgDCuvTqzugPPiT+bUPxfzip/wo+MdUj5nbUAhI8uFSPY5yuLUA+QGrluvEmPgXlCh83sZ/vSQ5PNkyzdBL6MqKb7sFTK7+BdCkHFKOdE5Ow8gc7DSsB3i0YC8hFyslkBmxF/fJ1lm5wDxT171mSnuysCqYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gWgGnkbv; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gWgGnkbv"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e5b29779d74so3760037276.2
        for <brcm80211@lists.linux.dev>; Mon, 10 Feb 2025 04:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739191677; x=1739796477; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sw4GIsTupaH+lw8i0Nwr5L7XDu0thVQ7gAEmZQ0sbUg=;
        b=gWgGnkbvJiUb708I42Km7MtvahKrFRU/n2sK+wZTpROX053zdyOKkVTs54nKSf+zQD
         3niGuD8Ez6Z4Olsnk3kEwzRmyvhewe02GnKPdRxRObhMKC5v0hAOw4P3nBV2D5be0VLe
         1gTGiGd7PfqeJfC0FbaPWNXzb2hCGGPGwcasH8agHC9Bfj7BlCqjlvJdDTAM7VUVIcWP
         WU57sRETQujRs/NWT1Wk7qVoBuXjybJpQy8vR9FGhzPZHMdzn3ULgLJmoXSn6NgrQFZ4
         E3f3+9iA74QeKWMnEDp4T4amU1ZSUkhQA3XVT++1rmf8LnTsfdI+7Ob27XEStDiFXuYt
         YVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739191677; x=1739796477;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sw4GIsTupaH+lw8i0Nwr5L7XDu0thVQ7gAEmZQ0sbUg=;
        b=EApaSOlbcdczFa326mA0KNnV2XEHUs4slpTHPoG6MOQYRo0XweKDnVQRIZ5mnOGslY
         2hOZHjJL1+m15GfVdleTsXuRj92gangVzh2ebPIVwrmG1Rom2hQPHfmqxDGhQjb0Wyqp
         XfJsr+2GgJR3maeJqa2REMPpX3NV9rCaynGMtGp8wUF9bQD9jVX123hprg+ncmCDYiCc
         7OPm1WcOQGn/40f0vSuX+Ni7D40VgviFKovB48a24Y9X6L/GgQmNrTeJ25cqfwcFDeVJ
         mWT0Ggt8VaqzYrkXzdZ5nJXuBXHnbxDOsO8nEjFTQ4rktqUL6MR/BXVQ07x9AybD8/Pd
         34+g==
X-Forwarded-Encrypted: i=1; AJvYcCV/OJU0Q6/hO1LcNDcZgJFbnRnqPfdvjOMtxaVDQScQfe7Z5GkWVBzDOOPs6keSHdil20dOzw05vyc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzu68UZjgbiU8OMVtMI0c/2Dd6IYyrcV9mujtc2QQ9IRVk3jUqj
	rH/RXOqlzH5LJV7/KqrBhm2yGeXI5PUS1+ak8V5ef/llzXCqvgOKSTfjy0DTZms1n87B3lKYAdj
	9CnJRE4GmbU5g0lNpHmHH/Qrc1iHXP+JNmjbKBQ==
X-Gm-Gg: ASbGncvY7vO7UQxev28OKmP0ju3odg7cuVONUAadSrZclPjmqD6YxRpwIwKmSUvrHb/
	Y3TNCiSXg2w/4Otrlou3k6UFvxFQApyq7l5RghGRl+qS/IPRl/BlklydaCTaF5peR6C3j/cqb1g
	==
X-Google-Smtp-Source: AGHT+IHCARCr3W2dsFBPoy0teQ9rJvEN+LQ+nr51lkt6u9aAaTFigHQA3uE9MDY3wAtkCUkPpWDJGs8q+V4NX86c+fw=
X-Received: by 2002:a05:690c:9989:b0:6ef:6a71:aa55 with SMTP id
 00721157ae682-6f9b2345b63mr118817667b3.0.1739191677606; Mon, 10 Feb 2025
 04:47:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cd1b13d4-b01d-4237-813e-bd48c55d9ca9@matthias-proske.de>
 <CAPDyKFr=XyLg2VjuEq1ZTrdAwSJJmYFDn9wSFj4zWD1+ZB9MTQ@mail.gmail.com>
 <6aa67bad-5712-441e-a24b-f787474472bb@matthias-proske.de> <CAPDyKFooyDSPu7RG18sp9cV1ndRPpg5yia1BAiqtb-c3cOqv5Q@mail.gmail.com>
 <efb9b9b7-bf56-4b3f-87eb-afd356453e62@matthias-proske.de>
In-Reply-To: <efb9b9b7-bf56-4b3f-87eb-afd356453e62@matthias-proske.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 10 Feb 2025 13:47:20 +0100
X-Gm-Features: AWEUYZkEspBPxh6Dm0nzMsm9DEgeqY_Rih6Dn3IzNI5XKW2fr4WXaZ5Q7HUECLM
Message-ID: <CAPDyKFqH+YHu-uxmTN_LJi7Q2DjcRLx2WBu6-hKsaz+3T0L+iQ@mail.gmail.com>
Subject: Re: DT property keep-power-in-suspend and how WiFi drivers use it
To: Matthias Proske <email@matthias-proske.de>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

[...]

> >>>
> >>> The corresponding SDIO func-driver may call
> >>> sdio_set_host_pm_flags(func, MMC_PM_KEEP_POWER). In this way, the mmc
> >>> core will leave the SDIO card powered-on during system suspend.
> >>> Although, unless it's really necessary, it's ofcourse a bad idea as it
> >>> would mean wasting energy when the system is suspended.
> >>
> >> Just to get my understanding right: The brcm_fmac driver would be the
> >> SDIO func-driver in my case, right?
> >
> > Correct. The one that is registered with sdio_register_driver().
>
> I guess I would just write a patch for the corresponding SDIO
> func-driver, adding a DeviceTree property directly in that SDIO
> func-driver (not the mmc host driver) so this can be enabled just for
> these specific boards, or would you suggest a different solution?

Right, a DT property indicating that we can't power-cycle the SDIO
card is probably the correct way.

We have a bunch of properties already in the host's node related to
this, so adding another one there should be fine too, I think.
Otherwise, an SDIO func device may be described in a child-node of the
mmc host's node (see
Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml).

Kind regards
Uffe
