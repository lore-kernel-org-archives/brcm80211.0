Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1AF1F130A
	for <brcm80211@lists.linux.dev>; Tue, 22 Apr 2025 10:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745318633; cv=none; b=kCjyVZ9JgB0/oCda8wWZ3L3Tdb8IRIGBDjnfn/rsH5sgLmWzDynnwmkiLOgUTKOi0sAVCvRyb2eiQsG21RU1OAR9WxdW29HX9oOTpDDNXJzi8AcxYNmHF/AyeD7qfj90KQQUXw/NshkBHZ9Lc6RnuOcTYTruKn/yFQynbX/a2W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745318633; c=relaxed/simple;
	bh=n9YStttPzf+7dwNCPnt66gph95yNu+I9t34XZeiQbyE=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=FXpCo9euP9Hf3yIc8hW/GPEWk5Zd33PPcwRmCx9XdH6Tln1P8Eo6rZ7+02Ncg6357tcNaoRWaj3X8rxJPv7/WXODexOZ3beVCqFf9mvt43XmTixDVYZDuFmpTGLd/tw/ZdZMzaZHBNnKbfgjlHLgO6CowumNcan5unm0HXEECqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ktApzwIv; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ktApzwIv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1745318608; x=1745923408; i=markus.elfring@web.de;
	bh=n9YStttPzf+7dwNCPnt66gph95yNu+I9t34XZeiQbyE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ktApzwIvgIEDnDAcz5FHRT6d3WiHap5ZIIISn+PcxoyEB/Fiz+dZbUhNVTkkS/5K
	 FY7j6oTOt+tvR1lwtyzzQv4fea8qJJBUFb0n2u3J5yq6IQg3OACPVnRlLkb8ouyMa
	 /IaG7SsWamqwLrBmwlRgkm2si9xPw1ID+nzCMOxN+2evXXKJzzNnIi16Q0Kg1olaJ
	 jIhBQTiJRvgm3MSP8shVW/XJ4FA/cpbSGbr88RwBbyqS7R7PlmSef/tNae4fDQ5nx
	 1olnvlzSob1dWrfIUqz11oT9kx3jAF00HIXYQEheBShJcm4Y3m4idgfT4Z72Je23q
	 SmvJeJPNvLooxWUTAA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.44]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MSqXM-1uY29u2h3O-00WJdM; Tue, 22
 Apr 2025 12:43:28 +0200
Message-ID: <d4de3f9d-5748-4969-98c6-7d17395eef4b@web.de>
Date: Tue, 22 Apr 2025 12:43:19 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, brcm80211-dev-list.pdl@broadcom.com,
 brcm80211@lists.linux.dev, linux-wireless@vger.kernel.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Arend van Spriel <arend.vanspriel@broadcom.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Erick Archer <erick.archer@outlook.com>, Jacobe Zang
 <jacobe.zang@wesion.com>, Kalle Valo <kvalo@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20250422042203.2259-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH v2 RESEND] brcm80211: fmac: Add error handling for
 brcmf_usb_dl_writeimage()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250422042203.2259-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0yUhLNxFOPtA0NXGmqmCyA7AYhTmkLF5aBbUbpQecai2dHLd1N2
 OKH0vrcRLRiqQ6Nf5ZulLI7rdXhIct4L137OFFsnAbKg/f/h3F3YZVOBE4Z75ijlJ0a5bLj
 /5V2BxLUvLpKw2UBVZSQvEZC4/CGSczkqnTZ5lnvNPYpcn91W3qviBhjlTQjKiNu1CpNtin
 Pkyt1WyKGqpvnolvEAHdQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nvqtF81D7Sg=;WInF33jei2kZx41v1Mr7J67xgKU
 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
 IY4zmEE3p/1poQK2UDxPmA=

=E2=80=A6
> brcmf_usb_dl_cmd() but dose not check its return value. The
=E2=80=A6

Please avoid typos in such a change description.


> Add error handling for brcmf_usb_dl_cmd() to jump to error
> handling path if the brcmf_usb_dl_cmd() fails and the
> 'state.state' and the 'state.bytes' are uninitialized.

This wording is improvable.


> Improve the error message to report more detailed error
> information.

Please offer such an adjustment by a separate update step.
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/submitting-patches.rst?h=3Dv6.15-rc3#n81

Regards,
Markus
