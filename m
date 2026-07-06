Received: from mail-ua1-f100.google.com (mail-ua1-f100.google.com [209.85.222.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779EA3822B4
	for <brcm80211@lists.linux.dev>; Mon,  6 Jul 2026 19:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783364780; cv=none; b=HaSdg9oabR1W+jWd3c9D5B+EyId44SKWuAV9rEj01aD94oUwbaq4qc+Rr7kKr09sMdb4GV3i8dkFyOUlmV7IuWnOt+jfu83OEYSTsfE8767ztWkIB4xVZSpkF+2H74zSxC2KT+O/64AawXtUIpDs3h+Vf2+D3OsTJvHxvLlNniQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783364780; c=relaxed/simple;
	bh=KvPjYSetF/yUEo5b4twvRTste5FXr5R4057h569+x1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RwYvj9TDRRgRzNwNVBpDroZgptdntZCF6OVtdf9sYC25IuYrCDixjOZAVPO39lhLtZndn8YGDf/sCGAfKE5wuiKo6alRPlE0/O+G0IgEyZFhOgp48i5urYlq5c300JsHLI4Y4zjxvmys4DI4SOLB10yiiF9ET3fiJVP2tSwlnCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=NabIcrS/; arc=none smtp.client-ip=209.85.222.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="NabIcrS/"
Received: by mail-ua1-f100.google.com with SMTP id a1e0cc1a2514c-963f63fe025so1009200241.0
        for <brcm80211@lists.linux.dev>; Mon, 06 Jul 2026 12:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783364778; x=1783969578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ic1Z9t9IaQ7A2sjcuIlUdtXhSR+9iAL555xfaUA/Ru0=;
        b=THfW6PegGXGaK5pjKvmrM6XBy2t7F8koG/Zv7o5fWB06pzJRpALRNPNcSQ0EcVCPS5
         CL6rXoyMMzBdlgMqk2B60SpAe4HN1qnz02rfaiL8QoLPlrdQKprwn3Ofz51+G3DBX6cm
         tzSiTzWh7d9S6TeoIsmL2i7sGoL7yLQz1gGfHk2LXDUq1D3bqCkwbAT4UNNAnXX5Vit5
         lVYAh5lA6wldbfS0YGLmovjJXLszj16CT0aDiB+a67ZkdvZAcED7/w5p9+EcrQ9GfQnq
         d3ZpXP1YdsjH52ZRLcLVkztE8jWZBpWssFGOzrRuqAztDm2KDXVV+iW2z4CfobUKzq4S
         zgSw==
X-Forwarded-Encrypted: i=1; AHgh+Rq20YuEDdQ7Xc0fn+/9BwmzqoNPhJ2UkPP6FeRvkQ8yzCybK79/IoA7rGr52UgpiaWAjCXinKYLnAw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCiaPbWpNj5oArhjf1n5NX2AZ6asavZ7IHohMPmdemIh9mzGQ6
	wwSUnpMdkFLlfvSTZDQ/1CxlAlJAl8epoZrKwZtBm4Dg94EVQdH0sTeyQIBLqY6/Qccpn4yjr52
	xp5SnyEdPcQ6stW9eZAU6fV7ujR7iN7jW33sMlriYJb4xclJqPb5tI6RAoHeKYwqEnWjxmbKZwF
	hYM4md1oNyI9/k8Jbp876S/7v6ZtYrxzv0mqaDmUTiolm1z7Zw32+fUcjAchoziETrjKfK2D+xI
	p97TjYd06Jd+Za11DYeEg==
X-Gm-Gg: AfdE7ckomoielufVu9YzxQ9nw9wg9x8kkT6+UGYRSONFDOwmXIAqcFGyPup+OWDI+9x
	7naYWYl82ElCKM/EwPTA0Xz5wLjWx6BljCJXNKF/xWuwZNzudmxihQA8IuOK/qHOAzAF0iJSBc0
	N6fUR5YicoOKUkcjHA1Jk/+jo2IGQ10dmwJlZgdH6GXAcT43uWOjVSTUzvWt7f4vM6bHi13ifpt
	0JVXVUa/Es5Ta9eBHH4AwzRDsAKMyuqKS4VOjEl0cHEaQbJv6o+CNn2Gvg1NCx4Iz5qTXj/9yCy
	qeer1M8UBrWi9zYZYJ4d/9Iph3jxQDGMU2CgkoKaeGB9VNNi9mYdrag3I8UZSze112MlcFFw+Qr
	Y09cINEBEf1dWaBqLPEQQ0UtyavzGQlMfxG63zLvHaOfjEwyKWkqYvoIUJaUoBOgbzMNsnA8W7k
	M1JivgbcxQ2WE8zFEN+EsH4sz1gWbtrna/kii6UD+jElstZfRCSw==
X-Received: by 2002:a05:6102:5e82:b0:726:e81f:f3f0 with SMTP id ada2fe7eead31-744b7d54bd6mr967521137.15.1783364778149;
        Mon, 06 Jul 2026 12:06:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-11.dlp.protect.broadcom.com. [144.49.247.11])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-969839b5e80sm613211241.4.2026.07.06.12.06.17
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jul 2026 12:06:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5fc4c7e9so376842885a.3
        for <brcm80211@lists.linux.dev>; Mon, 06 Jul 2026 12:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1783364777; x=1783969577; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ic1Z9t9IaQ7A2sjcuIlUdtXhSR+9iAL555xfaUA/Ru0=;
        b=NabIcrS/K29jFyXbA2LaGIms8Z/eryD8framlfuziIUbiPa/rExkQw2KRMt2hw/wBO
         ZlJoSi7O7ed/2JnqZRG0Yf6qCGSVwiTh3ZDIg2t83oPYwuDE5B4LA0DBfBpPFks1nDw9
         DDI0otLRaKk0w1VutoT41B1fW0Yg1fp2Yb8Wk=
X-Forwarded-Encrypted: i=1; AHgh+RqY/dXrf2Cv6xyJEkM7iHIB5c+hfipFQR6bdNGACQKPuWrCz8UgdeX0/J/zBWNR4eoHHC+dzSv5GDE=@lists.linux.dev
X-Received: by 2002:a05:620a:2908:b0:92e:6430:3c73 with SMTP id af79cd13be357-92ebb566320mr270472885a.21.1783364777325;
        Mon, 06 Jul 2026 12:06:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2908:b0:92e:6430:3c73 with SMTP id af79cd13be357-92ebb566320mr270466385a.21.1783364776661;
        Mon, 06 Jul 2026 12:06:16 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b800efsm964890985a.4.2026.07.06.12.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:06:16 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Kalle Valo <kvalo@kernel.org>,
	Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	Hante Meuleman <meuleman@broadcom.com>,
	Daniel Kim <dekim@broadcom.com>,
	Franky Lin <frankyl@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless] wifi: brcmfmac: initialize SDIO data work before cleanup
Date: Mon,  6 Jul 2026 21:06:10 +0200
Message-ID: <20260706190612.708609-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260619064401.1048976-1-runyu.xiao@seu.edu.cn>
References: <20260619064401.1048976-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Fri, 19 Jun 2026 14:44:01 +0800, Runyu Xiao wrote:
> brcmf_sdio_probe() stores the newly allocated bus in sdiodev->bus before
> allocating the ordered workqueue. If that allocation fails, the function
> jumps to fail and calls brcmf_sdio_remove().
>
> brcmf_sdio_remove() unconditionally cancels bus->datawork. Initialize the
> work item before the first failure path that can reach brcmf_sdio_remove(),
> so the cleanup path always observes a valid work object.

[...]

> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
