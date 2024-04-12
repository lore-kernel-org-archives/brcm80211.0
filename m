Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9D4446B6
	for <brcm80211@lists.linux.dev>; Fri, 12 Apr 2024 08:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712910038; cv=none; b=Wd6csX4dbsNf70urLUoj0c8o+EodBC25K5XcSRi7N7P4Pas6Lbjlb6XMKaxhx1TV0gr+qOtz0Kh7SGqG+BFGpu9WjaD8Et6rQ9gqL2f36aC1jM/LGd1KQIFBoKsKFJBFJlLTX4Wy+E1u803kgMThNywzlDHtFFvB9lrtKNesQTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712910038; c=relaxed/simple;
	bh=Aedlqc/+sWlrdhS4ESFI02d9zvfrw3+3l7iIyP8GAJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fy5M0dNUvIoYD5dXxCLxmqVbfuPr5mz/RvsaDcIAm8zuS3veTrAuEVLmIwj/JAIZl4bPXJotY8HdRJ1UV08QKWsgKkjCh9+4M9rtvvWfRYJuPxoHBGd7Pn7k8QZij+oD61zVml98AKRj67fl59tL4LsXstaIFuPPby+eauvlasQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yXVtp2ct; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yXVtp2ct"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-617dfcf80aeso6943047b3.3
        for <brcm80211@lists.linux.dev>; Fri, 12 Apr 2024 01:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712910035; x=1713514835; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aedlqc/+sWlrdhS4ESFI02d9zvfrw3+3l7iIyP8GAJU=;
        b=yXVtp2ctyzvasRmdY5g09gvoJjAsdVrkgGGI2ehoasFwa9/uxvLRACrmke7OYd114Y
         dU+EZy76q3zLGeOg1yIs8Ld7TAltqa+pQUWnKx3+UoEAYqydDcOprMkLzzGDSxTP+E9J
         2hQdOrNWjiy+i6L/r98cUMQKS5Z5NsQ2Epp1yjvUGdO0Ai9OUQHk8FZ+8lXbbDkPQKoU
         9YmeCteHmZwpOT50nO8fkj8NDXWl3DqHg1REcW5bOWnmfopSEiGFbCLAZEt8SWg2egMz
         RdD4tfGXS4/WCVE9NypjN/MFW4YwGrHbkcFplOHo62wp403Ha1dWP9r4Y2E0bDzif5/x
         xqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712910035; x=1713514835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aedlqc/+sWlrdhS4ESFI02d9zvfrw3+3l7iIyP8GAJU=;
        b=gDkgs61/mbBMaxx1E1q5t6M0YabS98kacGShLoTURYE+LHMqrn71n9yyhCEWkddLOr
         iVtqxh8OSYT3MeBuUZ+m2300wwmV43yfjqnR03OmUL25HCHB9QfYQLDfWyMv90o/3xoN
         Yubb93GHYEvCmxmq7hcb8Zj2QgKb/Vgp3ylwZr3KT+u6Y+SLEsq1ToXA50g5qYzi/dHa
         rMedVyizPhTgoOkj01lXJeh22ooSIFwRtx6uB5YCPtDdWTW2AcG6FNjOUIfazxGzocnw
         ljIjfDk/h8/I0PdtFcO1hYXrYlhbWwoaWGrQY4QW3N7fJQIhFl2N2xwLdV098TcR+O2v
         4RZw==
X-Forwarded-Encrypted: i=1; AJvYcCVNGaVZWgULw1RAVPthlfb48G0ZIi0BYoXJLR4ccexIaDBuCq8vODoOknXAXMdC63yTI5JNeMNTK79eBv7x7mUAnpmyVdB2C5X8
X-Gm-Message-State: AOJu0YygRb+FUCQI7AibZoUf7CZnjQBLfEjFmJO3dVZT4h8/HD5ZYkHt
	40SsPX2sEJruJvvQMb2VqJ/PAXa0ZkqyOALhD4o3que9I/9Va67nx5OaN7LXT6qxmEp0LWdJKi0
	DwvVoKbO0NRBX9CkN3Xg8YZMK4FyLrSmJKxSnUQ==
X-Google-Smtp-Source: AGHT+IG+4rQ6Eh9nveJlqBaXSsAk+9P2sQbLBF5MFuUjpO/kkQmwqe5TMpDLQMsN88iMDs5uoLIqTTKAs7BUYZSSmZw=
X-Received: by 2002:a25:900f:0:b0:dcd:40fa:7bd0 with SMTP id
 s15-20020a25900f000000b00dcd40fa7bd0mr1617358ybl.3.1712910035197; Fri, 12 Apr
 2024 01:20:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240408231727.396452-1-andriy.shevchenko@linux.intel.com> <20240408231727.396452-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240408231727.396452-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Apr 2024 10:20:24 +0200
Message-ID: <CACRpkdYaXVvtt3b9rFxU4ZNShD17Bm4XU9X3h4dY501iJy3kPA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpiolib: Fix a mess with the GPIO_* flags
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 1:17=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The GPIO_* flag definitions are *almost* duplicated in two files
> (with unmatches OPEN_SOURCE / OPEN_DRAIN). Moreover, some code relies
> on one set of definitions while the rest is on the other. Clean up
> this mess by providing only one source of the definitions to all.
>
> Fixes: b424808115cb ("brcm80211: brcmsmac: Move LEDs to GPIO descriptors"=
)
> Fixes: 5923ea6c2ce6 ("gpio: pass lookup and descriptor flags to request_o=
wn")
> Fixes: fed7026adc7c ("gpiolib: Make use of enum gpio_lookup_flags consist=
ent")
> Fixes: 4c0facddb7d8 ("gpio: core: Decouple open drain/source flag with ac=
tive low/high")
> Fixes: 69d301fdd196 ("gpio: add DT bindings for existing consumer flags")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The way the line lookup flags ("lflags") were conceived was through
support for non-DT systems using descriptor tables, and that is how
enum gpio_lookup_flags came to be.

When OF support was added it was bolted on on the side, in essence
assuming that the DT/OF ABI was completely separate (and they/we
sure like to think about it that way...) and thus needed translation from
OF flags to kernel-internal enum gpio_lookup_flags.

The way *I* thought about this when writing it was certainly that the
DT bindings was a separate thing (<dt-bindings/*.h> didn't even exist
at the time I think) and that translation from OF to kernel-internal
lflags would happen in *one* place.

The main reasoning still holds: the OF define is an ABI, so it can
*never* be changed, but the enum gpio_lookup_flags is subject to
Documentation/process/stable-api-nonsense.rst and that means
that if we want to swap around the order of the definitions we can.

But admittedly this is a bit over-belief in process and separation of
concerns and practical matters may be something else...

Yours,
Linus Walleij
