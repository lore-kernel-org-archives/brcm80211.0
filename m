Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7B716DC2D
	for <brcm80211@lists.linux.dev>; Wed, 31 Jul 2024 06:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722408094; cv=none; b=IE8tCDe0XsPc2TYj04ZaFC/1KoNqWam95spZyae9ucghDp99wMWhxj33OUuW8MfEsK3w8HmY8Mgnz6xU4GV0F0RwotBPUFrlsEdzsKmA3KPewUdVUaZKXphw/Giqv1+5UPqjfBpJtqYl7JBXjaVdnMJOEh7sjU8q8BzfPKGqIsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722408094; c=relaxed/simple;
	bh=xAM5KuCUk7fhZ0Bjto448CcHX5hPz++gECDIEyxNyJ8=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=XIuaZprlMyXiFX2JeeV3f8zD1IQzFeQBdWXiXrSedQW6hRD2D7AX7voR5rLcRdMMnVEIQHHDGt4wR8JTyB/la4GdzFa07wqr4X5lnwDtVUpr6hVJ+nEO69v/rOt1cp2cuPcQDu8FOjSOLxLe9VRrSkKTSCOlIvzq+y1kugsT57k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Wot8qQEl; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Wot8qQEl"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a1d0dc869bso388821885a.2
        for <brcm80211@lists.linux.dev>; Tue, 30 Jul 2024 23:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1722408090; x=1723012890; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzcsKxSamtz5qYylBq+mulofl7DNdl/8yBGrG+evBvI=;
        b=Wot8qQElzGIKPZDvP7BqXa7oafRlUl+IQYpMFpmFB4NK0KdIT/70N38ZC7z8AD12Gc
         +log5+RYkHbIelUJp3RSrJNolPinJZRZquTNMklTGXKrE6OIIlmbf2J1IfZWU75n5RJW
         +k4Q+dev3kE+KfCaF4JQpoeNb5sJTat4dESXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722408090; x=1723012890;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YzcsKxSamtz5qYylBq+mulofl7DNdl/8yBGrG+evBvI=;
        b=Z/lPJk4I1qa3wbBXMG84qZo6ArxewZGv88/v4vm7M53LD45Tn80AP3LLfcC3gLk1rR
         piGv4lR6OIfWzvNszl8SfnrTe47/4KT07EVn4ERBkhzW4Nq2UHuQPA50s3o6WcNyWrHO
         F1zSZnsnEWi4urDzBKa2G9bHTly+HRGzWVjSXlo6hiG+NJKi8uuUiMk0I8jlB220j2sR
         rOzp6EjtEM/PHgReGZk1n9RMPJGM4g5p2j3AOGh2AgJ3X59ghcMhUdsTtDbKBrnXm1Gx
         FmMvxs5sumuZWV+C2ZgksTGeHqjU0hOOxCw+REtbprF5HD+DTjwNm2yjx/1DJzpg1FU5
         Tr4g==
X-Forwarded-Encrypted: i=1; AJvYcCVP+ynzSxCpMJ9SdrpBpSF0P9adm9A1GMBdCoHrUnaDPcs6z7Cxqb7Gp1nMEkNilfSfsODORaLVIoSTeGVcaHwrq4kpCIH5rA8B
X-Gm-Message-State: AOJu0YxXLj79ryLeIQQ2Ps8EE2eulj1uf9O5jrP7xy+UmpgYIwAEoeT5
	HAdCTA7s6DaRvlPy8V65ceGk0VMOXdDpIv4CuIfOgxEvNGmFVCK8uypEnKerBQ==
X-Google-Smtp-Source: AGHT+IHVSnCSNUiDXZ50W1IsLXQBwnHUTc3D4diJbcUDSRlur70rvvyzQTE+g2F4ctDA9qBB1UnD+w==
X-Received: by 2002:a05:620a:4494:b0:7a2:e53:3f67 with SMTP id af79cd13be357-7a20e534344mr1952685a.19.1722408090009;
        Tue, 30 Jul 2024 23:41:30 -0700 (PDT)
Received: from [192.168.178.38] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1d73ed33bsm710259685a.58.2024.07.30.23.41.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2024 23:41:29 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Jacobe Zang <jacobe.zang@wesion.com>, <robh@kernel.org>, <krzk+dt@kernel.org>, <heiko@sntech.de>, <kvalo@kernel.org>, <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>, <conor+dt@kernel.org>
CC: <efectn@protonmail.com>, <dsimic@manjaro.org>, <jagan@edgeble.ai>, <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>, <arend@broadcom.com>, <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>, <megi@xff.cz>, <duoming@zju.edu.cn>, <bhelgaas@google.com>, <minipli@grsecurity.net>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <nick@khadas.com>
Date: Wed, 31 Jul 2024 08:41:24 +0200
Message-ID: <1910785a220.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20240731061132.703368-4-jacobe.zang@wesion.com>
References: <20240731061132.703368-1-jacobe.zang@wesion.com>
 <20240731061132.703368-4-jacobe.zang@wesion.com>
User-Agent: AquaMail/1.51.5 (build: 105105504)
Subject: Re: [PATCH v6 3/5] arm64: dts: rockchip: Add AP6275P wireless support to Khadas Edge 2
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On July 31, 2024 8:11:58 AM Jacobe Zang <jacobe.zang@wesion.com> wrote:

> Khadas Edge2 uses the PCI-e Ampak AP6275P 2T2R Wi-Fi 6 module. The
> pcie@0 node can be used as Bridge1, so the wifi@0 node is used as a
> device under the Bridge1.
>
> Co-developed-by: Muhammed Efe Cetin <efectn@protonmail.com>
> Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
> Signed-off-by: Jacobe Zang <jacobe.zang@wesion.com>
> ---
> .../boot/dts/rockchip/rk3588s-khadas-edge2.dts   | 16 ++++++++++++++++
> 1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts 
> b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
> index dbddfc3bb4641..b80a552dad883 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
> @@ -283,6 +283,22 @@ &pcie2x1l2 {
>  reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
>  vpcie3v3-supply = <&vcc3v3_pcie_wl>;
>  status = "okay";
> +
> + pcie@0,0 {
> + reg = <0x400000 0 0 0 0>;
> + #address-cells = <3>;
> + #size-cells = <2>;
> + ranges;
> + device_type = "pci";
> + bus-range = <0x40 0x4f>;
> +
> + wifi: wifi@0,0 {
> + compatible = "pci14e4,449d";

Probably need to add "brcm,bcm4329-fmac" as well here.

Regards,
Arend


