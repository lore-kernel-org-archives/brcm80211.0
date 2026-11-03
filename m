Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729564;
	b=fn8IOX3U+mThM3OrT8mDhXEQr4AuoBJQ9+lsaS40DKmdSLCvV6dV9n7blMtaU3JziU7w
	 T7fXqRanCVrcid4VKTCLw9CO7peAhp8OMqbzbeaunCHVkJVqZAEwkeU0kvwL4IB99XMUa
	 11KA4/bVJkvBtRkjU/H+sPtyDsCXiQ6v9g0FmCZkxqKEMvCpYKhQHn82bdPOCXZCSg6Wk
	 90/MmAG0mVvzvBUwuHZTmp5vbDEJYK4C3Eexc8LgE058mHQWawsl6knbBJ6RhZZOuyIKL
	 kkQSMyh6mfw1GZOC9CJOxYOwnfWmYIp06ByI7sLzfH/bNrrNqpi+4/GoNGEp4qAchBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=307AF/jEOxbdpPS8rhJxDrUHxY2uVxJwujwuyFVAf7c=;
	b=ULaZXHrE9iMGpBdQCvI8TKajVZlRUVwE45SDH9yfaiR6p6J7vyLqecg6gzoPeI/DDUTx
	 ZYQOwTqr+WOYEYxBSzMMOQFKvxa+xVu95pin43Av7jppbM3el0GkPCY1GctKgOHqyMeMP
	 nCiw9qM2vbagpf4GryjdAimU0LHGVvN6LuhvhjW+dkvYp1VCP/sCV3gAR3a11yzN3GrdZ
	 3gV8vScwTPU75FRGt2fwseSCZnUs/0KwLyjbMWpCZdav/R1eu1J4DH75BJL8iPhqq+8c9
	 mjXCR/0LHLWCXGoIW/i6wHHVG1QP97Q2Z9w2WrX8tffjY9CnPIT1QK+P4nOZ0IRslTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="bPbl/gpi";
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151FD606A324
	for <brcm80211@lists.linux.dev>; Tue,  3 Nov 2026 18:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 151FD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bPbl/gpi
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-677bc4704cbso4041981d50.0
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 10:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793729563; x=1794334363; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=307AF/jEOxbdpPS8rhJxDrUHxY2uVxJwujwuyFVAf7c=;
        b=bPbl/gpiS5jD0Yu5PNax9fudEGEeMmMwXJ+clvo6SKxXflJi2q9jai0qHnPcqx81Zk
         8pYmGmI5WHppl7qW/QGGZpgBzVxO5ehJmnnzvRAHkV3NFqRiCtYcP+RA5/y2WmDyYJLJ
         y7f5tVW6t9KR3yEAgrlMaTSwMMN+LPeAOZB2Fmq71yx09a20s2yKmbG54Fb5m5gRfQ1G
         KL/QTMgP3RSiKFoTXoG5aKkg74soh0CBBdblpVJhk1rhjVCbx4dadRg2wzfUwgQ2mavM
         6k6qjf5MFXbrW91a/2fZ9hWwJ8Grcj/8maR2Nw0gM++S/JKUAcvfyQgQHXfdvNvXY2XF
         7+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729563; x=1794334363;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=307AF/jEOxbdpPS8rhJxDrUHxY2uVxJwujwuyFVAf7c=;
        b=i7x1pILA/u4KJm1oxfXkwldIoTGRaB19z5S0ORcTf7tDxstBHgmn0OIk2mfZK4RyZ/
         8fyvBwdU7x2TE7FUmh9Bc5G4PWC3OWz618s+kaKLKbYQe4V5Bo2evlmxiwUJU+EkZTcm
         SiHXMCci9BfUReccgTUlS0nm10ag23EplMtn/o2iQdwJRtRZewbckJTFIBDT0JnFgiz9
         wbN0WVMwDIf91aeBAgQrk3m2wHjUyYbDPYoHUrYMPEYJl7Oc6yPySwZvZGBj8D5MfjKF
         I9RpDfvG3XWeN0QdRkrY4ckcc1RlbISZjY8NyCzfJUJibLy9B67EQuPxkkOkX3lgyY7T
         0doA==
X-Forwarded-Encrypted: i=1; AKwUvBxYgjzDu+mTpZTTglS8Jxr4WeKjptz/kIzaIQ6WXgGbWJxDK5hO/rttFu5mQ46uTNMADLvq2Q5KhpU=@lists.linux.dev
X-Gm-Message-State: APuU4Z8mR7kp7rglZAxOy4ci5ITKwNjQwNbVWneRGwQUWKXNnqGNW7y3
	MT+206QuXmxzHeT1UZJto1MIYHK5hKGFHGx9mlo6yOvsOHMYTOB7nN0l
X-Gm-Gg: AYBFou2Km9NI0p+QvFW3ejQfI/7WJRO9o31u3/6+hHwYt1YFTd4L2/AfGY587SRTe4k
	2eh0IkXZzKHb+W8kDAAPWmD3lqBqkTG1/NvB5CoMP8qynRFsKbV2XW6PVj7EBt6C16+lFyUUPUC
	Rd87Vk5ehuO9eIwP+XDtiASVLZ4RjfIgzg5K5lmbfctLEVefLr45J6PK65vPYDOQuCd+nTwr5Ms
	sfHJhWQFK5+jM8K5nFmsvzrKqQjmUYyAOWaRsDs1MDjaf83oknD70F877FUBT0p1BiH28iahojc
	HOnNS3I17IWuSY81NPWztv1zmeASCt3V5m9TRiED22uJkKxr0hK0eJV0b3Uin+2qulXl2lamZxI
	rrQzt/WxNp7uejA6fyxmRi8BqwLiPxKUYEsEdsAYYcpTuAzkS7EPeUIHbpFzh3Cpj3ihC3lkWH0
	9QmZ6RDT4DnmChkWdK/7XHebGG42El/3jY842kFK41HxYEW23Lj5YXeTnj+SkZGQl9XZwkOpda2
	RUnDHbwmeiNFAaf2+QWjwg3PXg8ahLpRLOqsx/1orgd4y/p2xt+GZdmyrwMaSmsRV9bxkctcLiw
	h943gXLY9ylRU4ZDJcbMz9/KcOE7On+k5ypELyc6nEbM+5nGi/nigqZ63MiQMQysINpOcnASrzF
	C5tjsO22WUw==
X-Received: by 2002:a05:690e:dcb:b0:67a:2ca2:8a3d with SMTP id 956f58d0204a3-67ba4c8842dmr7196675d50.17.1793729563101;
        Tue, 03 Nov 2026 10:12:43 -0800 (PST)
Received: from smtpclient.apple (1433037-static.lxtnkya4.metronetinc.net. [162.221.218.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3098c3122sm2112597b3.14.2026.11.03.10.12.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 10:12:42 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH wireless-next v3] wifi: brcmfmac: pcie: restore FEM
 control pin mode on Apple BCM43602
From: BJ Hinkle <bjhinkle@gmail.com>
In-Reply-To: <20261101172011.1591620-1-dolph-in@yandex.ru>
Date: Tue, 3 Nov 2026 13:12:32 -0500
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
 linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com,
 Angel Lindo <angellindo@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <908B5B94-5092-40DD-92D9-B19E9E68D52A@gmail.com>
References: <20261101172011.1591620-1-dolph-in@yandex.ru>
To: Sergey Armodin <dolph-in@yandex.ru>
X-Mailer: Apple Mail (2.3901.200.71.1.16)

Tested on a MacBookPro14,2 (BCM43602, subsystem 106b:0157) with this =
patch applied to Omarchy's 7.2.15 kernel.

This machine unloads brcmfmac before suspend and loads it again after =
resume. For the test, the sleep hook that normally sets bit 4 only read =
chipcontrol, with the driver unbound. After each of two deep suspends on =
battery, about 4 minutes each, it read 0x00000000. The driver then =
logged "chipcontrol 0x00000000, setting discrete FEM control mode", and =
5 GHz reconnected within 5 seconds with no status_code=3D16 rejects.

Tested-by: BJ Hinkle <bjhinkle@gmail.com> # MacBookPro14,2=
