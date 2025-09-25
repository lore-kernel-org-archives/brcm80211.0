Received: from mail-pf1-f227.google.com (mail-pf1-f227.google.com [209.85.210.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CA734BA3A
	for <brcm80211@lists.linux.dev>; Thu, 25 Sep 2025 06:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758780080; cv=none; b=QBfEQOGAUZE9sp77pgbNc8dYQkcCaQlX28alXs8OoiZlneZd2+6NYZ7vKyiQoiNuGQdm4x8jdAtXb0khM7CGfV4YcOI2MUJHAOHdeN8Fl2/1+6pMUPOq87yfzLMo842TUPYkdqo+aAukg3piejyrbpvwej1O25YqOTiu8U3JRIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758780080; c=relaxed/simple;
	bh=M4DQ6cako/KbCIkULxVrerW7+KLzokn2G8YKqyf9edQ=;
	h=From:To:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=J1mLeDRiYCCZppPEddM+jTD2xYCs6l0GitsL+fJZAVVmv+jTFxbC/xgUxbPEcPtLu1GoGmDTkyosfd9UTpO3Vb0YhOB8dBj9J+l2BGf9hgRQwvMg2UXarvJWf+Scx8kPCF8tnr7aU8WXhGy8W+wR1Wpj1icVUUiHyFZgA5Wjq+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XFHiulnK; arc=none smtp.client-ip=209.85.210.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XFHiulnK"
Received: by mail-pf1-f227.google.com with SMTP id d2e1a72fcca58-781060b3ab6so107293b3a.0
        for <brcm80211@lists.linux.dev>; Wed, 24 Sep 2025 23:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758780077; x=1759384877;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AlQaW4NJff/8NiELFp0G0mv3OSxJSeuPJWiPsjZSsxU=;
        b=gN/WR5u1y/mEHMtFtDQr8TaSz1FIL+esmjcuMlW7hGT5ixBt1dXfQdqYUjsSrLll0u
         732HIIe7Y6/qOE85n96f8AWrVmqj+x+qUB3g51KWgZ//8Z/OxLWZAvbaM3hutDv55HLQ
         PaI30O+1bgxfbv9FD1qmxIjKIBdDjRZcOvADuqXLCQtQI+A32f9466M3cRRNcjwL4c7B
         K2QeczPye+rKNre3EtatayMspOdiPvKsWOqUtwUcYkTlNou+qaSFzuMtPP7BZSg9RQrl
         WbnJWFsOeleBYHTkMi5vVixQXRHlcAYDwZDXnxJalCmc9YLE/jN7X2w0LU8c7rkvCdaM
         bVlA==
X-Forwarded-Encrypted: i=1; AJvYcCUnMd7AzHH5LbAdEt3euG0ZUjno4MXm5VQ+HwNzsah1Y4ShD0vbB69/e2p7wUThXEqGDRWasEaTTl0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+bJ/4CYkt1dPKAeuDDzS4V3ct7NeCvX1rVTfNVNddYH3GIo0M
	a9aAK5g8ak2L7c8lUQXdDBA6hErwJlgi8tXjk2jYyoWWcJxTIufm/k3YcpwmkqMYPr9orLuxhFt
	PIMGfgkkMF4W3xv0arUflELv4hcECnVrht/PfZAbpKjDKtWir4iHKQ48VN/2iNYQuMWACjhwKh9
	rPEjaZ3d2YuOteq3YBDM81JClzv8tJsSxPbsbADkQovCqyzHoeiw10iQGuxhEK2QlzonTdJSZK2
	LORiEIV76HnHk25ayhwHA==
X-Gm-Gg: ASbGncvWQ12uACGSo6kVfExuohUkcGfwuC2gNlqWs1dFMX9q9Lm3CRCJcntscgWwBfu
	7mLPaQ+WA0qBuD+B3mPYfNOzlLgNAbiNIUoPKTrXyXtfQB44jXUPX90UYTdVzA3YgMBkHMlM2Tk
	i2ChEbRpqV38c0lsYAEXDEM1L2n6Wt6kdJ0oLWsHMIWBZqemcUwV56AddvsByeE/w5UiHt8/P6f
	PE6iCWyFGrGCPhhqYbydTtZC+l+bN6q/OeE8zzIeQopFcd7XWLDGEUl+8pWfYu4mMgIXCTjQNEV
	b6xDyLkIeMsFSUDtwaQpU+F1lCX79IKJmnTY7rPH3bMaMt2uSw7h7BJqtV2YAEYrIPU1gwfmj8C
	DoFTOq38g56UCsqqSnX6zea3a5sJzQGspyPqORxQI6pcyCtAH3Ctz2TNK2PWJPa5RrM4Sbh0TWH
	B+vZfbcg==
X-Google-Smtp-Source: AGHT+IHWVaOb7sRYg+vkWp0pKr2sszkIEnICD4xJ7FICBWhLTOhNnaTnZvLh7bgcscmQNFWvN0M1NYz7zSQF
X-Received: by 2002:a05:6a00:1993:b0:770:4753:b984 with SMTP id d2e1a72fcca58-78101036c19mr1827585b3a.16.1758780076915;
        Wed, 24 Sep 2025 23:01:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-781023da629sm46577b3a.1.2025.09.24.23.01.16
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Sep 2025 23:01:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b2e6b2bb443so72331666b.2
        for <brcm80211@lists.linux.dev>; Wed, 24 Sep 2025 23:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1758780075; x=1759384875; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AlQaW4NJff/8NiELFp0G0mv3OSxJSeuPJWiPsjZSsxU=;
        b=XFHiulnKSDY2yR2hVDrbkH5qlcQjjW4kyP1OXrPn4aIzSDJoCLFGhdsbZflnaFiSls
         GXwik7cc6BypzprwJuOFkKzX1IuLgPfvk9eJmRCxiXBGTUiQmtTqAwqHinWLwqtUJcXk
         yqcoVWoGAbLh1UtvhIZJHBXaHp9YuEC2L98S0=
X-Forwarded-Encrypted: i=1; AJvYcCUptraP+Ut0WO0bILHsFgUsJ52p208hlt2HLunZTPBYAykpkgcRw9H1PJUhKhLWLzozNy5dVO/QYjo=@lists.linux.dev
X-Received: by 2002:a17:907:9618:b0:b04:97df:d741 with SMTP id a640c23a62f3a-b34bb8f1220mr224055466b.44.1758780074553;
        Wed, 24 Sep 2025 23:01:14 -0700 (PDT)
X-Received: by 2002:a17:907:9618:b0:b04:97df:d741 with SMTP id a640c23a62f3a-b34bb8f1220mr224051566b.44.1758780073964;
        Wed, 24 Sep 2025 23:01:13 -0700 (PDT)
Received: from [192.168.178.31] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f79besm93207966b.69.2025.09.24.23.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 23:01:13 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>
Date: Thu, 25 Sep 2025 08:01:13 +0200
Message-ID: <1997f762428.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <1997f6d2b48.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
References: <MW2PR02MB3674333A04868446C75C39EDB51CA@MW2PR02MB3674.namprd02.prod.outlook.com>
 <1997f6d2b48.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
User-Agent: AquaMail/1.55.2 (build: 105502562)
Subject: Fwd: Re: hostapd Kernel Crashes with IOS
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

plain text version

--- Doorgestuurd bericht ---
Van: Arend van Spriel arend.vanspriel@broadcom.com
Datum: 25 september 2025 07:51:25
Onderwerp: Re: hostapd Kernel Crashes with IOS
Aan: Chris Spargo chris@streetlogic.pro, linux-wireless@vger.kernel.org, 
brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com
CC: Jonah Finkelstein jonah@streetlogic.pro, Parker Borneman 
parker@streetlogic.pro

> Hi Chris,
>
> No problem. The null-deref seems straightforward enough so determining the 
> issue should not be difficult.
>
> One thing that I noticed in the log is:
>
> hostapd[1149]: RX_ACTION category 10 action 6 sa 62:a7:67:fb:82:3e da 
> dc:a6:32:7b:12:1c len 28 freq 2462
> Sep 02 17:23:08 raspi hostapd[1149]: Ignore BSS Transition Management Query 
> from 62:a7:67:fb:82:3e since BSS Transition Management is disabled
> Sep 02 17:23:09 raspi dnsmasq-dhcp[1143]: DHCPREQUEST(wlan0) 
> 192.168.237.234 62:a7:67:fb:82:3e
> Sep 02 17:23:09 raspi dnsmasq-dhcp[1143]: DHCPACK(wlan0) 192.168.237.234 
> *62:a7:67:fb:82:3e Pixel-7*
> Sep 02 17:23:18 raspi hostapd[1149]: nl80211: Event message available
> Sep 02 17:23:18 raspi hostapd[1149]: nl80211: Drv Event 20 
> (NL80211_CMD_DEL_STATION) received for wlan0
>
> So the claim that the issue is observed with iOS device and not with Pixel7 
> seems incorrect.
>
> Regards,
> Arend



