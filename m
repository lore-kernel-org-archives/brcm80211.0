Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D84537C0EC
	for <brcm80211@lists.linux.dev>; Sun,  4 Oct 2026 17:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791133628; cv=none; b=A9lhNrn8iRJjRChapJG63eKXETsaplhWIczbO8L+NGVUeXhMedGehdi400jaAFgmW3Sr9EB/7GfOIHvseJHADgNn27pqptvbHGkxFAhwQCxDSNAgQom/o3iNiNK8mhjpJYXY5bCkN4p/dF7wZ2yoxPUiGtPQEh1hP8bd+bAQGDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791133628; c=relaxed/simple;
	bh=OaAGxpPZexR6MyHBBVyckzT+rR4fO+d68d30SXtglZ0=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=dfOAa0WX+6cPqLkHjlbv5oclLrfIac9cfJnCcg06W3ADnlTXN/eXP4phKoxCwnnM1706XzEO1UnVEjqgFcRqBDL2wN3oxrFzttUL22annDQJuVEcJuBvsMzu8lsTmEOnInH7h1K+/czO1QFmU6naUaAVBYl2YyOKvpb9oeX6Hn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=RYADMSpc; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="RYADMSpc"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2df5b0a3540so1327095ad.0
        for <brcm80211@lists.linux.dev>; Sun, 04 Oct 2026 10:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791133627; x=1791738427;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tk+Gtt99hoarKyP0vohBXkdpiLY0JgLAZUcS9Y0MMUo=;
        b=gMAQcT/edz3WzNZgmWl39JzlYxbORypTALmliwYVwwQlWZ81WU9YBiqsvIX43BCUhv
         jyeo0QVPhfK9W0Vz8QLMQa338XfmSGLBeTkHL+2duRKxJv3vmObRNd2B1NX+4NiIXnIO
         DF32RW2j7EhS0BYRhxmfnG8yn3ZzHKGIp118lIE4rO2pDpd/XstXPXHmbvN++e/AV3Aj
         eecdN1e2UFS20QQFduxH436l5oobpzinwwm/EA2BNcsl/i6uP/1SMktJTVXGlNv2/xCG
         XgT6t6AKawBaij2MH6bBtzzM/LBXH54rMISkCiJyf9EY/NCs5/XcbGjjjh3wKyccCN7T
         ym9A==
X-Forwarded-Encrypted: i=1; AKwUvBws4m1uo9F/vSE8z4VSfwkjZIW5gksLyv5zyKtDShpZR2taZ0cbmMc674Wpwcds7jaGZLSn6LYHZKI=@lists.linux.dev
X-Gm-Message-State: AFq9FYKEaw66vhAh7hw1EF1Al0Hrg/P9UUSl5zIYhDQhnhaXwjNZmA/4
	5fZEQ5sNeiEOu7wTMbU85B5Qbgy/Tyfwjz4RzdESxfhHOAIAQkriLzoikh5f4bAFddJsVS15/wJ
	qGP+VZ/Okh4tSo5799tx6f49pPDGj1Isio2DkzWCBFTQoziTcI8EDVllKlOS5K8herlWGVGoh2k
	Z/456W2f0tnzNIGOo+1EuMjzDBayEJ1YuHZ4Jgq8ttCT84HsL1+3wQFpwFWNlNsS+4sZHzGL4B2
	RM2WhdodDxbXfwlLUp+Jw==
X-Gm-Gg: AYBFou25melojIbae0UZQ+YYI2IOO4sYgAZN2AXJTlbPJp6ejbPcfzV1EIKejtqcsO7
	vLP6N/2kJe6hs/ka6Z9DpdGvAxeqQAXIjPfpRIo3GXh5v4Kihglda0T1v8DVxheM6esFeBKLvf3
	xC0XpTPrR6CzeslkStKMXatBjWqtvzdnkRlSFOdG946+1EKfhn3zXDuWno0bVCOMaAbJaVAb2lS
	Z96FkOMMTNTATOeSrJFw+zUs2GMMwOzSRzSn7gW5DyMRsfwVhZ9hwegYObIAuIf+3H0+gHbN3/h
	jGh/K5c0R7Z/zJVBSPmzPt8oaDSrrIQcW9XCMYDRvgs5AFXGdv4tcpRHYSHBxQAu3Z3UQRUAoaj
	2g7TphnF6YMh5LR14P0vTajFbOJ6BoOMuzW+uJPASZOJMIFDH40m9fySRKN8WIwxC0pZJ/cJQnQ
	kLEOgx5Gg+50wD2F0fniOU0p6DLh+zIwGnsnYv6LCOCA==
X-Received: by 2002:a17:903:1a67:b0:2dd:c100:a5de with SMTP id d9443c01a7336-2e49b67e1e9mr80246125ad.50.1791133626563;
        Sun, 04 Oct 2026 10:07:06 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2e535d3df50sm552305ad.32.2026.10.04.10.07.06
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2026 10:07:06 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179524bf03so17888136d6.2
        for <brcm80211@lists.linux.dev>; Sun, 04 Oct 2026 10:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791133625; x=1791738425; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tk+Gtt99hoarKyP0vohBXkdpiLY0JgLAZUcS9Y0MMUo=;
        b=RYADMSpcqDDF8Anfak23DluvtUSeCZzdE+sHouzDDBUkp9ckgrO7F6b2pscEWcIIbk
         mcHByiyH1Vkpl+6B8jSKp5ubsyWppZRv+pBTLf4a9mouA7eNy1WZZSX66LnvO9UthNiX
         dTpw/EdpLAn6C4PxonF0W24oqRgHBaMBUiA9o=
X-Forwarded-Encrypted: i=1; AKwUvBx3C+tFTAyaBbno8DMuRmV5x3tbZD+UsOi6ZYU44iBKOxoAP9Wigp0vFvKVCk8ExbQX27i3SXcxd1s=@lists.linux.dev
X-Received: by 2002:a05:6214:2406:b0:917:a646:7fa2 with SMTP id 6a1803df08f44-917c007b625mr176709866d6.21.1791133625117;
        Sun, 04 Oct 2026 10:07:05 -0700 (PDT)
X-Received: by 2002:a05:6214:2406:b0:917:a646:7fa2 with SMTP id 6a1803df08f44-917c007b625mr176709306d6.21.1791133624551;
        Sun, 04 Oct 2026 10:07:04 -0700 (PDT)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0c17b8esm67871456d6.43.2026.10.04.10.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 10:07:03 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>
Date: Sun, 04 Oct 2026 19:07:01 +0200
Message-ID: <1a107e21b08.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <1a107d87260.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
References: <20260916064454.GA3635613@ax162>
 <1a107d87260.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
User-Agent: AquaMail/2.7.0 (build: 200700061)
Subject: Re: -Wconstant-conversion in drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

resending...


Op 16 september 2026 08:45:59 schreef Nathan Chancellor <nathan@kernel.org>:

> Hi Arend,
>
> After [1] landed in clang main, I am seeing the following warning
> (turned error with CONFIG_WERROR=y / W=e):
>
> drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:224:18: error: 
> implicit conversion from 'int' to 's8' (aka 'signed char') changes value 
> from 128 to -128 [-Werror,-Wconstant-conversion]
> 224 |         {0, 0, 0, 0, 0, 128},
> |         ~               ^~~
>
> As far as I can tell, this has been present since the original commit
> that added brcm80211 to the tree
>
> a9533e7ea3c4 ("Staging: Add initial release of brcm80211 - Broadcom 802.11n 
> wireless LAN driver.")
>
> based on my reading of drivers/staging/brcm80211/phy/wlc_phy_n.c. Should
> this final value be changed to -128 or should there be some other fix?

To be honest I don't know. If I looked at the proprietary driver code that 
table entry is still there with exactly the same values. So to be type 
correct while preserving the same value it should be -128. However, looking 
at the table entry struct it is an index so that sounds odd.

Regards,
Arend



