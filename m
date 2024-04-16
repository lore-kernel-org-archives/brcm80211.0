Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4DC8664A
	for <brcm80211@lists.linux.dev>; Tue, 16 Apr 2024 12:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713270143; cv=none; b=T9vLX6S95vxuWAH9yLAS3F076GU6qcYPzAjfJxILxpbaR4wcKBmQGxXasDL2qRcQ6upVJfQSIGNp6FRW1Imnvzharb3UshMLyGHCX2gX3PsR1MR1RmQ8MwzmiTUh7/xUt7YP64WZU/c2z7RIQ7LYQcBPo+kwddjdyuERMfq6bs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713270143; c=relaxed/simple;
	bh=DKrIFSDvPyPsC6ZdQ2dqkpMRmXsqmzOPCzV+pvng9tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rvk17/DKLKGrhLwALB84sbZxhoJOoVE3oMcSLaUDWZsZJhMbHjuBEYph/U3+YhrGJhUr74jl6e6jcrXiSyV2yp+qSMKysVKuCTKQim3No9v8PmLoz34Ou3sFluDf2ooYegXKPBi7OAqKt1l8vLN4jFzLzyXDq1YMOq4MmtnZ8hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xtjxJONt; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xtjxJONt"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so4295899276.1
        for <brcm80211@lists.linux.dev>; Tue, 16 Apr 2024 05:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713270141; x=1713874941; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKrIFSDvPyPsC6ZdQ2dqkpMRmXsqmzOPCzV+pvng9tk=;
        b=xtjxJONtdo6buiz1Et5UZbGL4+8spgmHorn60LNHO58w4JmMNyWosb0lW0l7DKVrh0
         cIYZnHfn/VQLxucXJbwqJzCo95EokLqg8HzTi+FYwFCweQkZIHZOHyIswHIB4GNgY8D6
         nXLLEwa6sG6Pz0jXE+4IceFODWt9fHyKqxsEZmtGTn0qsXXjXefkfBxtMy41FD3TVf1f
         r7IWnLeDuvKw0jLy5mUG0dp0eDKzjn43SYQAOiWpYgcmvZxkalkOnX8lXy3ojeU15MBj
         h03j+TwnbgHCad4l7tK8mffp5qE82/BKHWVmfhNDIrbFrNBy14caE2PmFdFTPw1Xf3ix
         YBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713270141; x=1713874941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKrIFSDvPyPsC6ZdQ2dqkpMRmXsqmzOPCzV+pvng9tk=;
        b=H1QMHjcaff8eKx51+pyWwMdzv42hU/OM3O2hU7Du5bLa7rnt1bT1/NZZR2P74/yxEX
         Q5XdPbftc/NkQP2t0pPYFj6OV76Yc2c0UICVLWNnQVyqHJddAvlrXGeAEvVB1Q/RD+Oq
         9XUVFnzlkjt8M6Gdzv9ga1kAjmlQu9w+hSNE9DF3mWZqb1fXty4zj4litq2P26fe/Gnd
         8w+Gf4l5JAdbAoY7FvB7YHvDmLJgEsrPQa1jmgnEXscF/NP6BPBvtyuGc/JzkT4p9+gL
         PGw5xNZ7MMz6X9F/InJJVZjJRNR7df+US3Z1eRYtmFJ2bU/aAIRSGSEFjKkFmgW+EbwY
         zVkA==
X-Forwarded-Encrypted: i=1; AJvYcCUKgvPmbiTtflUl5uMYssOguie4BCtv5pNG5UmIfbxxcBmDv6XxI8BdXbDVqTz05W2f9jHEit6xLVZO7hktZJJPEFzxNkusQvHR
X-Gm-Message-State: AOJu0YzPHZpcut1XfUaxo7B9iIjmtjc7H4C4sevAdNu1Js999gbNe7S6
	r7vH9lfJoHPq42/6zZbs4j8LmgSo99TqiQNUNDEuwnx/Brr9j6gLYhOqmYmkpGg8v3JsE0LfnP6
	esbv7J/8NgTdi4kzmArkg1met5EaFRmoEjap+JQ==
X-Google-Smtp-Source: AGHT+IH6I+79BV6weCSjyg+xHM274VtjfV8MzR1S0lXUMhI5Av+adu1GyzQ9NMJZOKWXpjT31ISM3wou5BWCwEtVdK4=
X-Received: by 2002:a25:8211:0:b0:de1:1af9:c7ea with SMTP id
 q17-20020a258211000000b00de11af9c7eamr10234568ybk.1.1713270141306; Tue, 16
 Apr 2024 05:22:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240408231727.396452-1-andriy.shevchenko@linux.intel.com>
 <20240408231727.396452-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdYaXVvtt3b9rFxU4ZNShD17Bm4XU9X3h4dY501iJy3kPA@mail.gmail.com>
 <ZhlSaFWlbE6OS7om@smile.fi.intel.com> <CAMRc=Me489H-mTfT1hfUsY47iKwoaVsf6sgkiBwBVkxJOBo9UA@mail.gmail.com>
In-Reply-To: <CAMRc=Me489H-mTfT1hfUsY47iKwoaVsf6sgkiBwBVkxJOBo9UA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Apr 2024 14:22:09 +0200
Message-ID: <CACRpkdZRp-DFQgb3=Ut27DHd1w11_aEY0HbLjJHob=C5Ek-dyw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpiolib: Fix a mess with the GPIO_* flags
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 9:44=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> IIUC include/dt-bindings/ headers should only be used by DT sources
> and code that parses the OF properties.

That's what I have come to understand as well.

I wonder if there is something that can be done to enforce it?

Ideally the code that parses OF properties should have to
opt in to get access to the <dt-bindings/*> namespace.

Yours,
Linus Walleij
