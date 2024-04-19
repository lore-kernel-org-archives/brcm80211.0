Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A498624B
	for <brcm80211@lists.linux.dev>; Fri, 19 Apr 2024 13:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713533367; cv=none; b=o673Ck93WufbBglMK9y+DNhpgpDQDo6rSKMsJKAByhgLBdyR6813dK1/JmimanFsr8W+SMLRrwsEoQiY1RdZ+nLBr8ht5HA77HsEhgOciRdqyrLV7TxmY89b0hSIyIG+1v60iMDIFIBdUqGurVRr+O/fYEiYj5AoToxaNm8J6+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713533367; c=relaxed/simple;
	bh=7JAiJ5Etf3MuJKuNZBjkja2+rCHW1cnBdM4LUduqTKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJLjjIzKQ71OOQ3b3Dtvoepb9o6vlZhxnRm0j5FPwpYk/3q2kiUzFuQqqygLzm0SRTqMsOcRwZPNKHo3hZs/Q+ulJCAhHdsovDt65wmCqh5F39S2TnMXJ+g70eg4F7mJHKFrWL+OspZApgWFuCJzRNxxEzStXzlvwVXIXi96y2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I/BFjThI; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I/BFjThI"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-61ac45807cbso22405947b3.1
        for <brcm80211@lists.linux.dev>; Fri, 19 Apr 2024 06:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713533365; x=1714138165; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JAiJ5Etf3MuJKuNZBjkja2+rCHW1cnBdM4LUduqTKQ=;
        b=I/BFjThI5Vfr/r1NQy0elxOiGffWEgVH3/AUc6AFdQWteKW+y4FAxJgQJu26Pk8xSe
         s94ap/edXrRDbmStDsMdMNaJJx/FL8QYcYW/lAwpqiUaYEGDHGEh7JooaJi3bCpMTfyr
         ljDO4p234lUdp/VWC5IT4BtM7hd3rJd4+WKenF6QvfHE4jE+PDrQpYRfb8gpA5ry0BYs
         tpFEdELywy4f43LxspQZEDKFYdGGTXbLSk3M1Wo54niGR5drWDcf5o67GMj9PGz3Z3pV
         kyX97JoFT0hQzcNzV5qIzkG7rvx/PWBQX3HAg6s+9Y9O/LayM65kub6b4Z4TgekF1ftw
         h+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713533365; x=1714138165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JAiJ5Etf3MuJKuNZBjkja2+rCHW1cnBdM4LUduqTKQ=;
        b=uj8NXNsO2Dvia19P96gHdy8cM1UHgepRVpiXx5svyI3qixyD7i8jqqr9APXNPZg6hz
         MWnd0VFn4rTHrwidap/qoKQ1Ont2f3mrnqXj9uDgj1hAgAYSkrPT0HW5uoWf4wEkM1xV
         GoITH1HiWl+TD3TmbRfax8KwxxZN40HvnSi3BfPhznTiNoe2KRUBumog0Xfq36wrurkt
         PP33Wzx0fdv9r9jcb+c0QVkyTM+LSEH8fGabSMOQ0AVjbNN/rQ/5My5tSUQN4keuXeWR
         6TOSVQxldloYyp8PHHV8pdlnFT4yzUL3g/mpNr6KRI2B8Bzulb7XAaveTuui3UDlx3he
         u/oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcWNm4Geeh0P+WGTEHUj3BpTEQwXCdnCE7KyKHTxRXXOnbLbwgjJDThpL99Mc/0WNXM2nfJKE13dXgEYe2rxMcauoCdEVKB/kM
X-Gm-Message-State: AOJu0YxWhtuEcx9V6L/ZbAgzC+rPH/oW+Nm3xgW45P4kUUCg9Ej8Xbvc
	Ld6k6jFU91YATilM0qnUWTXKmGb2eGN7Aq81NFVYZBkTK0jXUDlbRcxMgVSIwmLEnvvRkdqdlns
	37HZuWw2/D4CZXzFRUnfthlHTkECLYh4alSe57Q==
X-Google-Smtp-Source: AGHT+IFgMs/8AHU4XdiOhdZmmG+AX6lMDzgX2zHpudUuHQbXt36lKVWz9la2Pxkh/EmTXCCM3Oc22brh0qqFa3E8lKQ=
X-Received: by 2002:a25:86c7:0:b0:de0:d45f:7c5 with SMTP id
 y7-20020a2586c7000000b00de0d45f07c5mr1937027ybm.20.1713533364785; Fri, 19 Apr
 2024 06:29:24 -0700 (PDT)
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
 <CACRpkdZRp-DFQgb3=Ut27DHd1w11_aEY0HbLjJHob=C5Ek-dyw@mail.gmail.com>
 <Zh6FkejXcwBTAqIR@smile.fi.intel.com> <CAMRc=MeXV4_MT5_DKYtHqO+324dFJnr+Y1UtR9w9mj-y2OOqAw@mail.gmail.com>
 <Zh-MMAjf6hhNOCpL@smile.fi.intel.com> <CAMRc=MfJdfwP7=a3govCcj8XHR7uPwCf2BA+BiWqif74pW5u8A@mail.gmail.com>
In-Reply-To: <CAMRc=MfJdfwP7=a3govCcj8XHR7uPwCf2BA+BiWqif74pW5u8A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 19 Apr 2024 15:29:13 +0200
Message-ID: <CACRpkdYHuw1K1VYbTH3YzvmZevt_whNsd1ce58wCSd1+B1np5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpiolib: Fix a mess with the GPIO_* flags
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 8:40=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Unfortunately my TODO list runneth over. :(

When in situations like this, patch the objective into
drivers/gpio/TODO so others can pick it up, that's why
I created the file, and it has actually helped a bit!

IMO you don't even need to send edits to this file for
review, it's just a work document. Just edit and commit
it in your tree.

Yours,
Linus Walleij
