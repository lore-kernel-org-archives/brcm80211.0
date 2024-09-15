Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DA21BDCF
	for <brcm80211@lists.linux.dev>; Sun, 15 Sep 2024 06:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726382960; cv=none; b=U92vLr2f2c09Vx0t1va7m0iaBuNrqViL98dKyXpuDcm7IxSG5jf3LnZOAIiebd53qt8DKs4RUmsNugc8R7uk5nTO+y2WWNMTRstoHqOmt4pEyBvQMM0uxwEESySnaJB2YUDSdry4HukkdFbHzofiVH4iLrL+AFLoa5b0Sq1mmWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726382960; c=relaxed/simple;
	bh=UJ5k25ZV3lJdTTaM8tIb7kjVAGzanB8T92WEAesbG6o=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=UqbYPA3PSVXa3rxUx/CibqDXc5OMK35gsl+ALYCAfrXqQoyvgPJ25zMHEAfixFC91rUSzmv33WX2DUZsnq3UFOy9bndUpAc4CzAsbpX8SgYIuBummpFYw3GaJNsXZz6i8izk4+A3rfh92QrL3flmsQ2B0w39rOmF5CHg929+YAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=CMjRCe1h; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="CMjRCe1h"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2da4ea59658so1953004a91.0
        for <brcm80211@lists.linux.dev>; Sat, 14 Sep 2024 23:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1726382958; x=1726987758; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWfnMMz7l99gAM3XlLaOGRiADmU0oeZX94hUcKz22ns=;
        b=CMjRCe1h/WDngaksT4stfVkWeJbjE9omGNMvVtHLEN7Ab0rAdZ5fQEMZir1FFxJPXp
         DnomItZ3AH86G3mv1LZyhhkPf+EyXGhQNG/iVIlDjntqdYltieKuSGe8DjC0gbx26V5i
         d6g4XXhwgFw3HjCa6QHqhzbNSY7WShhvjXMkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726382958; x=1726987758;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kWfnMMz7l99gAM3XlLaOGRiADmU0oeZX94hUcKz22ns=;
        b=A1dJk5L40Irn+UE5KRirXv5q3LrVTSmLa7tzLRZrqnaqMGD0lTYqGcCleQo3cNbdcD
         hAilxuNQoawqwcF87frrkbLhgiRKc9jKdmctyV1W0GNjeWe2e3qV1aWAvD0hdQieWsP4
         yxwZbT4Aktfi4IKOwb2CKlJSMVcy9FirwSr/+26wIOha+BJDeNhqwCoddE+/R9T3p1Yl
         LbDVvrXfPs7lI8RGvMH3aKaUTuKVf97Xkh4CIlCGg0Ot50EBMfHXnIJEEyn8CdlzA4B6
         t2Dstesfc4u5hh5td4aBo2eEZzR394feI7w/YTPlxDa0IennPhE3iihUErHtISiJzx5P
         jrVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlnZJ4r/RuoYJIvEb+nkpogmw2BTparw6oXPtLx6Sds77On+LJzPnflQjOhT4aRhnXIGRM+rUxMoc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxxbD2ytWXQnkssi1I4c8yzW2zmtgMTYweO84cfuV7fxXd61fzo
	4t8NUsM1zzPGa7CCnR+m8U3F9ndUy6v4YmQwQmSIN9k/dGVFEqvr1HjBD9wKZQ==
X-Google-Smtp-Source: AGHT+IFE3Rw0RCxoDKs6dsS7IG+u5rzl9WSQMtzPPbskf+XeDvZ7pl7wwvVVMCZwzpDSVtxvmCYueA==
X-Received: by 2002:a17:90b:4f91:b0:2d3:cd27:c480 with SMTP id 98e67ed59e1d1-2dbb9f7d558mr11323825a91.33.1726382957920;
        Sat, 14 Sep 2024 23:49:17 -0700 (PDT)
Received: from [192.168.178.38] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbcfcbb42fsm2576910a91.4.2024.09.14.23.49.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Sep 2024 23:49:17 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Jacobe Zang <jacobe.zang@wesion.com>, Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, van Spriel <arend@broadcom.com>
CC: <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <nick@khadas.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 15 Sep 2024 08:49:09 +0200
Message-ID: <191f4714288.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20240910-wireless-mainline-v14-2-9d80fea5326d@wesion.com>
References: <20240910-wireless-mainline-v14-0-9d80fea5326d@wesion.com>
 <20240910-wireless-mainline-v14-2-9d80fea5326d@wesion.com>
User-Agent: AquaMail/1.52.0 (build: 105200518)
Subject: Re: [PATCH v14 2/4] dt-bindings: net: wireless: brcm4329-fmac: add clock description for AP6275P
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On September 10, 2024 5:05:46 AM Jacobe Zang <jacobe.zang@wesion.com> wrote:

> Not only AP6275P Wi-Fi device but also all Broadcom wireless devices allow
> external low power clock input. In DTS the clock as an optional choice in
> the absence of an internal clock.
>
> Reviewed-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Jacobe Zang <jacobe.zang@wesion.com>
> ---
> .../devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml       | 8 ++++++++
> 1 file changed, 8 insertions(+)


