Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F14912D745
	for <brcm80211@lists.linux.dev>; Sun, 30 Jun 2024 09:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719738915; cv=none; b=B1o/Aq2QBSGoRTeRJpWph74PTP1SfUGoOHqDVd2aNuZ02f+NMEsqxcPN+kJj7AA57+B8Q/zVwOSUvGAy86z/H3Bvh0bD6vSbi9qeGnTHUBbYG4p0vnUkfZmiqhtFnVWug8YixZRXh8Q+GwqLjKlbTzQNSNcLNdNTgR2bG5h7O48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719738915; c=relaxed/simple;
	bh=tc+Ufg00udHbrhXlW8SdH881js1R768qk0khtQCwXfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C6QK9N/LzdlU6+cr65hCz3Lc2IQ+7SP6cqkiUIyx9+2YumS+9ATKbzSK9xj9irsPhpdqOznuxRJ13u8fGxJTU/dKp83A3/O5CWAH0//gdzF+CVmnAJ7pX9g5D1bK7Gx942IADzfhEPFWDfBCVjISxTOhU/geY6DXqt1MZBTtOko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=en4uil1K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="en4uil1K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E946C4AF0C
	for <brcm80211@lists.linux.dev>; Sun, 30 Jun 2024 09:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719738914;
	bh=tc+Ufg00udHbrhXlW8SdH881js1R768qk0khtQCwXfM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=en4uil1KnZ/7MbdeOWy8vNN5qJWiUXY0l2SbZobfjZ8oplSyoWMu1lOkjeF8flaH3
	 /HV9bJ7Vv9kKv17jPnFYwEukaevW6iRTUbbr5QDOdTbDZa3n6lDKP1nTClVwZpq8+J
	 oLaPu6sLyqwDf8E5OWmtJo7s5wiOFHtSqV6PrOxjaurK1T+ap5dnqpfGVBAeURsbSe
	 TFAgfJQljWDYaCUdX8gxQiYJybypsxpSCGjM1obpaU26PlmwrDoAjm1+7EE7AWAQTh
	 jcCs2X75RvRjSA5W7N6I/D1JRGNwVEi8P24nBLFrROD6E/ZZHuaJSCEo8rj9dPsIHL
	 Z81Vj7v43wiTQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ec0f3b9cfeso23743531fa.0
        for <brcm80211@lists.linux.dev>; Sun, 30 Jun 2024 02:15:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLuKFWlmTgGrxCDewsuvPWegvnsmheZp2B64K0SnvZUnXc07kxLE4WkEaY+c3LCnt65yuQDAtIifm3cU0vj6T857VP8y+rj1K9
X-Gm-Message-State: AOJu0YzAe6HXalkWEycpRutanjc9AMKm/kpJc4JDgEo4R5MyJzDZpege
	KSgvoNo/kRZMDBJDON8VhubTKBSuKOscL1T9R69CwbuQoJ2BuRO7hGfsGuLU/lCq5hrtGfP8Ep5
	FkrT6Mc6ZhcEGMka2MFBxgxy5a/Q=
X-Google-Smtp-Source: AGHT+IHYW4n5GnYJwHXqY+6mUXvauoz57bZueShtW/YuVL9pXD9MpL3q7Rr5kG0lABD6uVFGXFXO7kcRPrfoJTzNisI=
X-Received: by 2002:a2e:a179:0:b0:2ec:4fec:8bda with SMTP id
 38308e7fff4ca-2ee5e6cd6a7mr18022581fa.36.1719738912735; Sun, 30 Jun 2024
 02:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240630073605.2164346-1-jacobe.zang@wesion.com>
 <20240630073605.2164346-5-jacobe.zang@wesion.com> <bd661690-1de8-4030-a209-ef26d3559221@gmx.net>
 <TYZPR03MB7001AC28827A86338BF2B77380D22@TYZPR03MB7001.apcprd03.prod.outlook.com>
In-Reply-To: <TYZPR03MB7001AC28827A86338BF2B77380D22@TYZPR03MB7001.apcprd03.prod.outlook.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 30 Jun 2024 17:15:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v66Vk8SMs1TOs+80Jy5fXumuYqCx59Tzd_N7wJAfyysQcw@mail.gmail.com>
Message-ID: <CAGb2v66Vk8SMs1TOs+80Jy5fXumuYqCx59Tzd_N7wJAfyysQcw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] wifi: brcmfmac: Add optional lpo clock enable support
To: Jacobe Zang <jacobe.zang@wesion.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "heiko@sntech.de" <heiko@sntech.de>, 
	"kvalo@kernel.org" <kvalo@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, 
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"efectn@protonmail.com" <efectn@protonmail.com>, "dsimic@manjaro.org" <dsimic@manjaro.org>, 
	"jagan@edgeble.ai" <jagan@edgeble.ai>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arend@broadcom.com" <arend@broadcom.com>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, "megi@xff.cz" <megi@xff.cz>, 
	"duoming@zju.edu.cn" <duoming@zju.edu.cn>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"minipli@grsecurity.net" <minipli@grsecurity.net>, 
	"brcm80211@lists.linux.dev" <brcm80211@lists.linux.dev>, 
	"brcm80211-dev-list.pdl@broadcom.com" <brcm80211-dev-list.pdl@broadcom.com>, Nick Xie <nick@khadas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 30, 2024 at 5:10=E2=80=AFPM Jacobe Zang <jacobe.zang@wesion.com=
> wrote:
>
> Hi Stefan,
>
> >> WiFi modules often require 32kHz clock to function. Add support to
> >> enable the clock to PCIe driver.
> > the low power clock is independent from the host interface like PCIe. S=
o
> > the clock handling should move to the common code. Sorry, not i cannot
> > give a good suggestion, what's the best place for this.
>
> I think the clock is used by the PCIe device so enable it in this file. A=
lso I checked
> use of clock which in spi[0] or sdio[0] device was enabled similarly to t=
his.
>
> [0] https://lore.kernel.org/all/20210806081229.721731-4-claudiu.beznea@mi=
crochip.com/

You're looking at the wrong driver. For brcmfmac, the lpo clock is toggled
by the MMC pwrseq code. And for the Bluetooth side (where it really matters=
)
for UARTs, it is in drivers/bluetooth/hci_bcm.c. and documented in the
binding Documentation/devicetree/bindings/net/broadcom-bluetooth.yaml


ChenYu
