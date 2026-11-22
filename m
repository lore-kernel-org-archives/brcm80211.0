Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378185;
	b=YSXylSRJcTJXICB7E9yLhJPM8JjNRboLfnUj1Zd7MRVLYkhcXRE1LQzMwzYASAfFxBjw
	 o8b9i0KR8Gnf2uctVb+mXr6bDBWg+tkx45Vgf/PHD0aWB3Ru1I5x08iLBeZffqA7rZO2w
	 asgymdcMTxwa+brKwQB4wrCIkt6o9MFgw9CQYfvcb9409CA1dZtxaggq52UTh+HVnws8q
	 Wg+opeNsCvaxFk4AesSOcLCYu/jtv6lCBCMoyGUzrDvc/kbZv1rofu6X0OIA2po6m8j8+
	 yDcb/Yhc8Ofe68yTOfmyUZGjhnorirjEn1iqWR+uNmnaEki4ctUCJ6OGn36aqey7zWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378185;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=eZo3uX94fDb6i+qgCUNfpTyWWfZP+yOV9UK8ddrvWfc=;
	b=GYLDs9LlsAQRpjcYj30iufr/0+C8y49a7YdQ/D1+PwE/bDn3snpQw64eBlU2ZQ7+zih3
	 ohB9x27c5+qXlQQ+lB9ASqyGbbnlupfPXUufQ83JkkCT32uIFkSd/PSLvyaTmBTqsmpgu
	 Wp9vcrQ6O8afeDWtrpk2sW1xk4DN9IhrS+fpyepRf0MHx3eT4rBBCnLoGG1M7MosMTH8n
	 2FqQSqN35IkZJfzhmGqRUrExpTrYKP/v2mR+QJmHGMAgOH9JrrSnLlBnxhXAlz3vD+1/a
	 aIWoFykDsLMdUBR62msC96qaw3eAc9RzJ7ipbgHGf1tKxYX0p+W8uJw6bHe6mp1C3Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZieRJIRN;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665F6606A33C
	for <brcm80211@lists.linux.dev>; Sun, 22 Nov 2026 20:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 665F6606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZieRJIRN
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b44bdcea8aso773883a91.1
        for <brcm80211@lists.linux.dev>; Sun, 22 Nov 2026 12:09:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378184; x=1795982984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZo3uX94fDb6i+qgCUNfpTyWWfZP+yOV9UK8ddrvWfc=;
        b=VGlpX9T43KQH9ZgXT1p0RXkfoAACTwCG+AJ48AusfIQdhjSjinxvhhnGrXNGuS7n8f
         RrLEvSx/R3auciZpKVMIIfTn1e+R/YKuCRJAZKpYOmoBqiYG7c1fFV2Q73SJF9ShaWWV
         fRQFUZK1T/tmAdwHllO+3H8cyqxBffRG+oBLJVbQFbnwqejeSifedpk7b234izm2fi1+
         x6r1hhQgOO4HYSoN0AYVut9Y0BJjeNcnr0XHnEzA8vktIBB2t7yFG0+iqH84j93ZXZD8
         BMOBWEVKzECrCI6p4UyEUvMkT8lzTxqvq8iN0/DH1RLgcidp6PQyU1ChCmDUVuPWlTbj
         jODw==
X-Forwarded-Encrypted: i=1; AL+hErFi424cPdKUtdG58sLF89SClGQibIs4LDvbmpLZspJ/GPtPu9zip5lkptwMVSpBEORmHtGf9s0M4rQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z8Rc2SWJUEW/l3manJ0Tz3dowcgCZd6/WP33tfbwPYSi4OKn7X1
	sLfzuxCqrU4IoxJUkeFTILOnD/YZQ1aYW1OYQg5rU6RbZHy9N92v53fpUnsdbvBTR0Z7UwXk4DY
	v0DpcPRGobbtc8NzTpsQP0nNdpMggecbKGnED2cFxzFx3TmNTdwj7pCLz7/pqn003a/bImt+j/E
	BTjQhuxNQn3s1fyqpCc6n1L0B3KHbGuzEyKSrE08hbdgKvaJNC6ViNyvmxMDC6mIfwp8oo5aqlX
	iJoIeGHFqYK0L7jXLfQWA==
X-Gm-Gg: AZFdTZclXjwwHZLAxUr707K+eFzTmy4MWHApLW2EL1Cvi/0Kaltep2kW/hytLFC4zob
	UnjSqtsh/nZE6R9Z9frAyfWi/0MiLr6zOkt64E8nS5MAb0FKDms9hRZAOTPJJS7jppUOa+7PliM
	nDL9T7bAYe5JD3fG40sn7x0LhgzTrOq/SXtpwfqaRNx6VR9hRMQLjggq7WQdhRiyoXawxRcicJ7
	NsRWnxVL4NpUAvEx7Jxi1WJ6o21HfTv0u6A8+MFDjfSjFpSRoSBeVoPRbggTleGXDQXzSRy5drV
	k5P3qgr1apXFPvPEApvyJHdTOXyJtmHF8ZbmMtQnHtClhojBxrmk7yicaI7hsGAZvjPMI+uyZYf
	6OC23r7bv54qLE91lQ6JNgjoOWKcOWd0dohwQETVbLck38M2J2ZISvlJzY1liEuL4UPBZjwgOgF
	s26sgmwUtxcBnTj36Xp9L7xIYkBmIor5ff5qYwND+61A==
X-Received: by 2002:a17:90a:e54a:b0:3b0:9310:b255 with SMTP id 98e67ed59e1d1-3b41c961506mr3995943a91.36.1795378183706;
        Sun, 22 Nov 2026 12:09:43 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ff51aa0sm3022035a91.2.2026.11.22.12.09.41
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2026 12:09:43 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so505326885a.0
        for <brcm80211@lists.linux.dev>; Sun, 22 Nov 2026 12:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795378181; x=1795982981; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZo3uX94fDb6i+qgCUNfpTyWWfZP+yOV9UK8ddrvWfc=;
        b=ZieRJIRN9yigVW4IJ32uSDwpE9uWmGpBS9OM+0oK0dpe4954hVv4AJEyknT3YvSO3+
         ejbtGI8pa2okERDtCZAOfKWfyk0fyKMLeNhk7KhjmS3MDfZy4MMxTCqh56c7OPXb3hGx
         PcPuiDaUX+4ofTl8mhVBMrZ9bPmnTRbbB94VA=
X-Forwarded-Encrypted: i=1; AL+hErHo5KrRhQ6BDLhKa4jytBtyv/iyoVkXIpPOGln7YNv4ohPTFEgPvXkTjAcKO4j8eRnVwbrtFHlAMjk=@lists.linux.dev
X-Received: by 2002:a05:620a:45a8:b0:949:a6b9:25e7 with SMTP id af79cd13be357-949bab310fcmr1492154585a.38.1795378181019;
        Sun, 22 Nov 2026 12:09:41 -0800 (PST)
X-Received: by 2002:a05:620a:45a8:b0:949:a6b9:25e7 with SMTP id af79cd13be357-949bab310fcmr1492150785a.38.1795378180574;
        Sun, 22 Nov 2026 12:09:40 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm664845385a.14.2026.11.22.12.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:09:40 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH 5/7] wifi: brcmfmac: add the AWDL data path
Date: Sun, 22 Nov 2026 21:09:28 +0100
Message-ID: <20261122200931.2090372-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151547.70333-6-dev@deq.rocks>
References: <20261104151547.70333-6-dev@deq.rocks>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 4 Nov 2026 16:15:45 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The firmware passes AWDL data frames as 802.3 frames. An LLC/SNAP
> header with the Apple OUI (aa aa 03 00 17 f2 08 00) is followed by the
> AWDL data header 03 04, a 16 bit sequence number, two reserved bytes
> and the ethertype.
>
> Let the AWDL network device send and receive plain Ethernet frames. Its
> transmit function adds the 16 bytes of headers and counts the sequence
> number, brcmf_netif_rx() removes them from received frames. The headroom
> of the network device covers the added header. The addresses of
> received frames are moved so that they form an Ethernet header with the
> ethertype again, which keeps packet taps consistent. Other frames on
> the AWDL interface are dropped.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/awdl.c        | 83 +++++++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/awdl.h        |  9 ++
>  .../broadcom/brcm80211/brcmfmac/core.c        | 23 ++++-
>  3 files changed, 114 insertions(+), 1 deletion(-)

[...]

> @@ -252,6 +274,67 @@ int brcmf_awdl_del(struct brcmf_pub *drvr)
> +/**
> + * brcmf_awdl_encap() - add the AWDL data header to a frame to be sent.
> + *
> + * @ifp: the AWDL interface.
> + * @skb: Ethernet frame, an 802.3 frame on return.
> + *
> + * Called in the transmit path of the AWDL network device, which serializes
> + * it. Return: 0 or a negative error code, the caller frees @skb on error.
> + */
> +int brcmf_awdl_encap(struct brcmf_if *ifp, struct sk_buff *skb)
> +{

Same as in patch 4, Return: has to start its own line. The kdoc
check reports no return value description for brcmf_awdl_encap() and
brcmf_awdl_decap().

[...]

> @@ -653,6 +659,19 @@ static int brcmf_awdl_netdev_open(struct net_device *ndev)
>  	return 0;
>  }
>
> +static netdev_tx_t brcmf_awdl_netdev_start_xmit(struct sk_buff *skb,
> +						struct net_device *ndev)
> +{
> +	struct brcmf_if *ifp = netdev_priv(ndev);
> +
> +	if (brcmf_awdl_encap(ifp, skb)) {
> +		dev_kfree_skb_any(skb);
> +		ndev->stats.tx_dropped++;
> +		return NETDEV_TX_OK;
> +	}
> +	return brcmf_netdev_start_xmit(skb, ndev);
> +}
> +
>  static int brcmf_awdl_netdev_stop(struct net_device *ndev)
>  {
>  	netif_stop_queue(ndev);

In brcmf_netdev_start_xmit() tx_bytes is taken from skb->len on entry,
which is after brcmf_awdl_encap() here, so tx_bytes counts the 16 added
bytes of every frame while rx_bytes in brcmf_netif_rx() is counted
after brcmf_awdl_decap() and leaves them out. Count the length of the
Ethernet frame on both sides.

[...]

> @@ -693,6 +712,8 @@ int brcmf_net_attach(struct brcmf_if *ifp, bool locked)
>  		ndev->netdev_ops = &brcmf_netdev_ops_pri;
>
>  	ndev->needed_headroom += drvr->hdrlen;
> +	if (ifp->awdl)
> +		ndev->needed_headroom += BRCMF_AWDL_HDR_LEN;
>  	ndev->ethtool_ops = &brcmf_ethtool_ops;
>
>  	/* set the mac address & netns */
>

The MTU stays at the ether_setup() default of 1500, so a full size
frame reaches the firmware as 14 + 16 + 1500 bytes. If the firmware
takes less than that, set mtu and max_mtu of the AWDL interface to the
largest payload it accepts with the added header.

You can add my acknowledgement for this patch in v2 series:

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
