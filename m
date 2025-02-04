Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1374E21421B
	for <brcm80211@lists.linux.dev>; Tue,  4 Feb 2025 15:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738682839; cv=none; b=LvkUWY3kT8jzkYrfkE0XXNUqs26hyQaMpn0OYOW/W2n9npcDTfXgQLUgRfxo9+B3pIDEA0eqfk0Plf7IKAOuGwd4f5BzXA7Wn8uHs1iNpWu2+5dIb70g8+f9b6UYgNP/4NWZ5NzETnqWokcCy887OWSbGNG2WnfIsjDy4anraN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738682839; c=relaxed/simple;
	bh=6bbw6NuplC45g5e415URYITIdUl4aCpORburWx1YQSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jiue5ilHrMLzO9rglamSq2RBIMt15NOOARtYtTU4V52Py09dr8V3vRjU+0mh3REHTce0AXJnlvszPOy780vETACRYFVVyRKuKASehNNeGWoUsfyEkT0yJXkHQapih4fiBtbxE3KfcyYbUzOrKRLJJ/GwSXyR/DVJvND5yU175Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DPc/lP9X; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DPc/lP9X"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e5acbbfc4e7so5446591276.2
        for <brcm80211@lists.linux.dev>; Tue, 04 Feb 2025 07:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738682837; x=1739287637; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6bbw6NuplC45g5e415URYITIdUl4aCpORburWx1YQSQ=;
        b=DPc/lP9Xj3vK7YFYLCENsf1RWCAT/AK8HslSq8TY7sJVc7gwx2KClmM5CgTrLh+bEv
         fc0hzXU2dU/lDpAsf9JVXX/k9jJGRTrWZe5A+PUoYhzJCaCpnA3sanezr9YcWHiyTLBy
         njxrG2DATE6+pzkBXd7Uj8l1ftYfk85Y4wuAmWBXgY7MFFwcjrlh33qzbOrALj8WSXkQ
         HR+U+gy9O7gWTH6NBOP/Z87V/YEmE0/YP7D9cobgewasoOyBuKa/vcHMYXR4BYFBwSdF
         q4gBw5JKlJ3GDsI1QwJImbz2Kq8aIe6ee0d9ltU4Im0ZEs7w8IHJMJTmIymUdVhQdIz4
         p6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738682837; x=1739287637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bbw6NuplC45g5e415URYITIdUl4aCpORburWx1YQSQ=;
        b=A3KRCA0GtHzIV/CNTN7e9iitDvlpV7EAdalBrzRa6smc2DQWoLfiSVl2Fy7FX2PKQE
         Z69XAgT2uOpGp/RhgaSbxmZjNIptllbAtGgvI9q/HAxy20UME28oGAW8yQCLmWxpq7CE
         5TP+lk6qt6EbQlts117YEMz40pE1M3uCU7NvcyRevJ+1YNbqxsIi/vyWiHHfIfPJw1sM
         EZAUwQJvkOCQBr4czg9+cq9NwuMFyUOBbJg8pI7ytGkT78aJ0BRycejw+0TQWk2JFGaS
         CcUxVRkMhyPhLMlWiTwG3+170CGi22zGkOxJ6RwwcB+GCtK21RJxP7zTx+X8t+qHbiWw
         5rgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbf7pc6KWrMLNzeeR2700Xpes7bf4qo659oN8CUMihK1OnewGmqVO1ENIF9F51Gc45f5T0TVJ0WGs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzEO4Zj3A9ipLGp1FwhDt9lvBnI3bolkrTNEaKKjervtT+X6/hP
	0dLmVeSuCmA0/kNSx/claPX6pjs2+n/vrlIXLQX/bH5OyiSE/lhcD0+ZENUm1ZBQjkBszCUGG3H
	nVQfNW7XZazckJAktieFIgH2prIstqd1vmH9kYw==
X-Gm-Gg: ASbGncvACIw6RoNY80BkMcXt/dMxDu6XLHhTjilqhfUyWqEOkklcy5WH3VVKf5q8CYg
	y50ptdDTVCtYxLiJnmqsKMvStzi2bVWQ/WfuXlbzUaFCtysNVPw7Z3lEJbe7vo1Q64jmOJvaveg
	==
X-Google-Smtp-Source: AGHT+IGuTehydOk3Axr20URL8vBy9g3qWXoLiXwzZEf5vxniYy62jE4Kl9yHuwqLqMu97MIGL+LC7qy+k9L+D/GoJRY=
X-Received: by 2002:a05:6902:2808:b0:e5a:e625:e513 with SMTP id
 3f1490d57ef6-e5ae625e61emr11909922276.12.1738682836852; Tue, 04 Feb 2025
 07:27:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cd1b13d4-b01d-4237-813e-bd48c55d9ca9@matthias-proske.de>
In-Reply-To: <cd1b13d4-b01d-4237-813e-bd48c55d9ca9@matthias-proske.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 4 Feb 2025 16:26:41 +0100
X-Gm-Features: AWEUYZmzVPGqQjAUScsSlKOO9d6YlW9_MWDY69DsffBTqZs8gHgQdoTz5D-t8mI
Message-ID: <CAPDyKFr=XyLg2VjuEq1ZTrdAwSJJmYFDn9wSFj4zWD1+ZB9MTQ@mail.gmail.com>
Subject: Re: DT property keep-power-in-suspend and how WiFi drivers use it
To: Matthias Proske <email@matthias-proske.de>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Jan 2025 at 12:05, Matthias Proske <email@matthias-proske.de> wrote:
>
> Hello,
>
> I have a question regarding the usage of the Device Tree property
> `keep-power-suspend`.
>
> In the Device Tree documentation it reads:
> "SDIO only. Preserves card power during a suspend/resume cycle."
>
> Does that mean that the SDIO Host Controller will remain powered or
> should this equally apply to anything that is connected to this SDIO
> Host Controller?

Unfortunately the documentation isn't really clear.
"keep-power-in-suspend" means that the platform is *capable* of
keeping the SDIO card powered when the system is suspended.

Depending on what the SDIO func-driver (like the brcm_fmac driver)
decides to do during system suspend/resume, the mmc core we may or may
not keep the SDIO card powered.

>
> To give a bit more background:
>
> I have an embedded board with a brcm_fmac WiFi module. It seems that due
> to a hardware limitation we are not permitted to switch the module off.
> It simply cannot be re-probed afterwards.

How did we manage to power it on and probe it in the first place?

>
> The property `keep-power-in-suspend` was used and that used to work fine
> until 92caded ("brcmfmac: Avoid keeping power to SDIO card
> unless WOWL is used"), which made the wifi adapter by default turn off
> on suspend to be re-probed on resume. Not working on our board...

Would you mind elaborating why it isn't working?

>
>
> I have also looked at other WiFi drivers with an SDIO interface and it
> seems that none of them are really honoring the `keep-power-in-suspend`
> flag. Is this flag for the SDIO Host Controller only?

See above.

>
>
> What would be proper way to implement it so that the brcm_fmac return to
> its old behaviour if necessary?
> Add a Device Tree property directly for the brcm_fmac driver..?

The corresponding SDIO func-driver may call
sdio_set_host_pm_flags(func, MMC_PM_KEEP_POWER). In this way, the mmc
core will leave the SDIO card powered-on during system suspend.
Although, unless it's really necessary, it's ofcourse a bad idea as it
would mean wasting energy when the system is suspended.

>
> I would like to write a patch, but I would like to know in which
> direction to go.
>
>
> Thank you for any feedback
>
> Matthias

Kind regards
Uffe
