Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4B11C4ECE
	for <brcm80211@lists.linux.dev>; Tue,  3 Sep 2024 18:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725389966; cv=none; b=a8vTxcTNbsX4g+0XTizP7P8Oa4eBcFD3CmG20lsjxHyJLg/i98s2k6I1He0TgQxjqCbDGazp3rCqH10scf/ebq1+wc7E/nzYTf6jlCOmj5oNqW4sdClLk2xmhqZh3YdAP3vQzjQblpN2yP4WwQ1dCPuySOoTAJ3vO682ZxsfHLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725389966; c=relaxed/simple;
	bh=9TTFd2hhLualP7P0anivRWZJQY9eJQxI1ngy05lrXxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HpDmymoLsrdL7wdhCHTs44IoYUHYW01aY4hFI1moC98MLbAXV3p41w/K9e6Gqb/gBeLJNoQlL4e6HzpNyH+XrX8gx0CBGJOC97PjlBjepQAXLdQNVwFePOusKouBlUYWuC6F5An0XxczORXJ9PpACgMQSyUTNG9ak44AycGfimg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J1F7Uwdp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1F7Uwdp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F99C4CEC5
	for <brcm80211@lists.linux.dev>; Tue,  3 Sep 2024 18:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725389966;
	bh=9TTFd2hhLualP7P0anivRWZJQY9eJQxI1ngy05lrXxo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=J1F7UwdpA/pPZEwuZ0/4B+dyQecUZs4ue4kj+s2CJEyPYfHPZ0IqIEJOgD3Ifhorx
	 5qMQc8p2qsGAGR9PPwxY9F2GjEfx2J9/X8wMagcmlpMy0GAGaBedOOiO/PT/oyqrlB
	 C8HqFblUQ905PsjMgdgNV5ftgrRJJRB8r4+njGopFECEoSKrtgJe7QtYL76ssT3E0G
	 kW2RBzcGNjIUnx4QxV6/rgUR1A+sbfP67u4Hx3nU7DmTxE7ijdJOpaJLhzHiP9g3Yd
	 gCT0r06mtKL3lS7yikFsz7UR2Wf12g+lGZcRwizQ2K/b56Oq4UdTYc1jUQIAfPzQc2
	 KBcc6yWpODipw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5334adf7249so7316513e87.3
        for <brcm80211@lists.linux.dev>; Tue, 03 Sep 2024 11:59:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXy3Ve59O+ST9SAbqFtHPXLGjMq665O6ouGLukS8Kunf+k6HbOpoO543kjiqJYsPTKueKe7IdQvmhk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVt668NfH1mTIW5GPkxbOB3+RRFQKuKJf6h9nbOW8moZG8ZgXT
	gx3Z5XsWmGbKJ5YvuU4lDet4SvDVq/uVnWxa+ZhqCceBYibqie4IKq4PQfTnknftEAJCkyayxEY
	pJYYxJJkeU6e81cQNsuWFqtR0Lg==
X-Google-Smtp-Source: AGHT+IFpL/WAwaJEUddqnN23QW8H5LGR9Grih1m7MNNFfq750+qLMqm2X5GBNRTbFyO1BzABy+6jr6rWs+y4p6UfciU=
X-Received: by 2002:a05:6512:3d8d:b0:52e:7f18:176b with SMTP id
 2adb3069b0e04-53546afd8famr11677026e87.11.1725389964567; Tue, 03 Sep 2024
 11:59:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240902225534.130383-1-vassilisamir@gmail.com>
 <20240902225534.130383-8-vassilisamir@gmail.com> <172537438003.978249.2559307502514402788.robh@kernel.org>
 <ZtckM-uRzxAnS15o@smile.fi.intel.com>
In-Reply-To: <ZtckM-uRzxAnS15o@smile.fi.intel.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 3 Sep 2024 13:59:09 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ+bQx-0KsN3ZWsZbQuAs0rV9DDTAjT_jJy2OBfH1WXeA@mail.gmail.com>
Message-ID: <CAL_JsqJ+bQx-0KsN3ZWsZbQuAs0rV9DDTAjT_jJy2OBfH1WXeA@mail.gmail.com>
Subject: Re: [PATCH v1 7/7] of/irq: Make use of irq_get_trigger_type()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Vasileios Amoiridis <vassilisamir@gmail.com>, nico@fluxnic.net, pabeni@redhat.com, 
	daniel@ffwll.ch, davem@davemloft.net, kuba@kernel.org, olteanv@gmail.com, 
	saravanak@google.com, linux-kernel@vger.kernel.org, mripard@kernel.org, 
	edumazet@google.com, netdev@vger.kernel.org, 
	brcm80211-dev-list.pdl@broadcom.com, f.fainelli@gmail.com, 
	linux-wireless@vger.kernel.org, airlied@gmail.com, linus.walleij@linaro.org, 
	brcm80211@lists.linux.dev, andrew@lunn.ch, devicetree@vger.kernel.org, 
	linux@armlinux.org.uk, alsi@bang-olufsen.dk, tzimmermann@suse.de, 
	kvalo@kernel.org, arend.vanspriel@broadcom.com, 
	maarten.lankhorst@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 9:59=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Sep 03, 2024 at 09:39:43AM -0500, Rob Herring (Arm) wrote:
> > On Tue, 03 Sep 2024 00:55:34 +0200, Vasileios Amoiridis wrote:
>
> ...
>
> > Applied, thanks!
>
> It was fast :-)

You're right. I didn't really look at that and was catching up from holiday=
s.

> Vasileios, consider my previous comment as a material for followup,
> if Rob likes the idea.

Yes. I've dropped the patch for now.

Rob
