Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A9A157A55
	for <brcm80211@lists.linux.dev>; Sat, 10 Aug 2024 11:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723289028; cv=none; b=W+UE8eIR0U5Rw8vtEmptq8kdSe/UCGQySw2B1gMdDjDlBHf9e7nh+/kfI751fz6HgsLuRvgCBvw28yr5REOKrnYlnwtYeaNe/nqG65UM+ePQlvSXKCU8E1qYIjoBORJ9vEj5frCD2Ru2qdkJFpy1P9ac5fmFjXXGiSRALkFEx3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723289028; c=relaxed/simple;
	bh=/11QHOe4lP1IRUIYesxzlPXVFs/uUVXBt4XVSCD6Wd4=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Lc2rTtZPxFiqL7Ilvz5fMyWyl+cTLDq2Nq3cTnoPU07uUltw/8l5x5uM9EnPgwARwn2QTlytCyuJUdUkAPN/vKDWGPvb6ninENaVTFSmxX6Ll9I422PBIRp2yyJXawYiPs3dpYh90notMiRrpviIl1evnJCcxB0B9jI0NE2r2jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hJB4vsbW; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hJB4vsbW"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5b7b6a30454so3375865a12.2
        for <brcm80211@lists.linux.dev>; Sat, 10 Aug 2024 04:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1723289025; x=1723893825; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDh1fCmWj10iQxhI7WVQeAn05256/EGfVYp4b/9uFoQ=;
        b=hJB4vsbWVf3Dx2GzQG3zFR0ajv8pt4auIHvPB6M8u29H2+t8bNclSDGegdQoX1SjBw
         nxyNw+ytw4sIvHyTysXPZ0ylAOvIk+L3ak5QPiua8sxFLKN+Qw6asRDTPGYYbWkZbzgt
         4HK9BmJEo6LQrTxXiDtwAr1x3NhkHganRkC4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723289025; x=1723893825;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nDh1fCmWj10iQxhI7WVQeAn05256/EGfVYp4b/9uFoQ=;
        b=PPHe07+FN/WML3mfcRnZqEGG809dJOa/ROM04HfB52UHii//qxhFpc3sjclDSad/1y
         J1FIAplu6fYVDMvUfuy28S+8fq026nwFaEIExmiGn9WoIue/EDMzLx364kGU80SvOWn7
         fnCJXX/C7kFj12+GDEgtC6hGQC339rsq6s/SgYTwEN55rQJItcbrynGmYavVVF3UXzgl
         OjffMnALsbTdOjyAHC+VOHR9zwXEyBsHQPD/Mf3DHB+m8xKOJDZrsCiPowaWsEazO9uh
         jJ9nzEYNJ2t+UUQF7ZwynnAostRYUN04mnccaCRVMUx6iTA+LK0QTGK7+69f+jd4N8Xs
         LC4w==
X-Forwarded-Encrypted: i=1; AJvYcCVdehHPbRaiGrWHZ7q+L91Fl1QiOh8mlJ2XqG/gZiFiqQJEOscTI2Arw493SQScQLLFCtgJISCI08SpG+MmeVwrP8YkpNqV+A4L
X-Gm-Message-State: AOJu0Yyh3RDHCkiWbXmtJCv/7AkPtTS33NUXHYC20JPCguKJNtOzxVlg
	s4CLbBuLDN7pEkKpubdJUMuobmayrgSq4vFRYrCajVUHesWG7K+NAiEtJWtkeQ==
X-Google-Smtp-Source: AGHT+IGFm1oTOum+km6q9IW7OvihX00b13brOsvRjwSLEedERSI+44X5FqA6T/GsmR2C4k72tHaIfw==
X-Received: by 2002:a05:6402:2791:b0:5a2:763e:b8bf with SMTP id 4fb4d7f45d1cf-5bd0a61181fmr3652216a12.25.1723289024565;
        Sat, 10 Aug 2024 04:23:44 -0700 (PDT)
Received: from [192.168.178.38] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd1a60181csm530489a12.81.2024.08.10.04.23.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 10 Aug 2024 04:23:44 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Jacobe Zang <jacobe.zang@wesion.com>, <robh@kernel.org>, <krzk+dt@kernel.org>, <heiko@sntech.de>, <kvalo@kernel.org>, <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>, <conor+dt@kernel.org>
CC: <efectn@protonmail.com>, <dsimic@manjaro.org>, <jagan@edgeble.ai>, <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>, <arend@broadcom.com>, <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>, <megi@xff.cz>, <duoming@zju.edu.cn>, <bhelgaas@google.com>, <minipli@grsecurity.net>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <nick@khadas.com>
Date: Sat, 10 Aug 2024 13:23:43 +0200
Message-ID: <1913c07b218.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20240810035141.439024-5-jacobe.zang@wesion.com>
References: <20240810035141.439024-1-jacobe.zang@wesion.com>
 <20240810035141.439024-5-jacobe.zang@wesion.com>
User-Agent: AquaMail/1.51.5 (build: 105105504)
Subject: Re: [PATCH v9 4/5] wifi: brcmfmac: Add optional lpo clock enable support
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On August 10, 2024 5:52:11 AM Jacobe Zang <jacobe.zang@wesion.com> wrote:

> WiFi modules often require 32kHz clock to function. Add support to
> enable the clock to PCIe driver and move "brcm,bcm4329-fmac" check
> to the top of brcmf_of_probe. Change function prototypes from void
> to int and add appropriate errno's for return values that will be
> send to bus when error occurred.
>
> Co-developed-by: Ondrej Jirman <megi@xff.cz>
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Co-developed-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Jacobe Zang <jacobe.zang@wesion.com>
> ---
> .../broadcom/brcm80211/brcmfmac/bcmsdh.c      |  4 +-
> .../broadcom/brcm80211/brcmfmac/common.c      |  3 +-
> .../wireless/broadcom/brcm80211/brcmfmac/of.c | 53 +++++++++++--------
> .../wireless/broadcom/brcm80211/brcmfmac/of.h |  9 ++--
> .../broadcom/brcm80211/brcmfmac/pcie.c        |  3 ++
> .../broadcom/brcm80211/brcmfmac/sdio.c        | 24 ++++++---
> .../broadcom/brcm80211/brcmfmac/usb.c         |  3 ++
> 7 files changed, 63 insertions(+), 36 deletions(-)

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c 
> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> index 6b38d9de71af6..461b7ff3be24b 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c

[...]

> @@ -4474,8 +4480,10 @@ struct brcmf_sdio *brcmf_sdio_probe(struct 
> brcmf_sdio_dev *sdiodev)
>  bus->brcmf_wq = wq;
>
>  /* attempt to attach to the dongle */
> - if (!(brcmf_sdio_probe_attach(bus))) {
> + probe_attach_result = brcmf_sdio_probe_attach(bus);

There is no need for probe_attach_result anymore. Just use ret variable 
instead.

> + if (probe_attach_result < 0) {
>  brcmf_err("brcmf_sdio_probe_attach failed\n");
> + ret = probe_attach_result;
>  goto fail;
>  }


