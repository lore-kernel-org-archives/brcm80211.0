Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96ED4EA394
	for <brcm80211@lists.linux.dev>; Mon,  7 Sep 2026 13:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786080; cv=none; b=DOm2LCYP5z5hNkQeLhrTqZe12C3fNlIL/tn/UDwF7d7tpLkUTIqHp4rsSDNnYjJV766eeRV6tjyqE2xyU3fHZwNEZTvvvPrHVrGsAQEYmR7JwtFYl+3NqLcUB7bso2rZ5iibW9x9R9HBFXyK9BYRIbgDlZE2SfXSoToP0HT5LFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786080; c=relaxed/simple;
	bh=XJC28kyFBFHh55MFL9xqSsgO3JBx/Prlq6Tro9Wq2vU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=A6BuHGkxn1yLGuZQ+0FCds4VpYPJ+ta2adlZIv6sVSF9qgY+jQSIVrorVXtgb/ITJzc+B7TlukCUFe9yUJPJNY9pvf9msN7lG78Jw21PL5j6znEiW5n2hQ/kwv9Gy8BHA3omO2wvPbFziTCiwkUNt8RTKQicNuaCzjBXtnMPb0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=TMwWLqoc; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="TMwWLqoc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1788786055;
 bh=0Mb9UwR4nTQJB2bRA3Lqm6lyxR/KAuxHEv2Zzy1Jh38=;
 b=TMwWLqoc7D5GJT3dgMzmNwQBwyYRaWTb5Xdo3cW//IojHpzLfK7Tv10jajh/JKmyRaAyA2Qx8
 AqXMGDNw12NaDb26NN6ZQLCkpJECL2YJLL6UDXotOwQXr2oex5jbQwpajlwRuLYNQU1CGXZdndA
 sgLfzrKHnK/OxvtxO++PvVn0bNr4QdioP7JL1FEXWDHPVUHb/wjbkFFlUypXM7hBRFYSZ17eplS
 2G1dJ649c9cTgZxWZ9VwLQfIZCTyExJGVmSdikQ/7i/OQbxNxof94M9iV5lm89yix6Q7YnzCU53
 vUUKYezhGcIymeYO8a+GOZNeJnYzHKpodtBBRa6ZWOww==
X-Forward-Email-ID: 6a9eb58316171017b32b9267
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 07 Sep 2026 09:00:49 -0400
Message-Id: <DL93QEI0KQC8.30Z9WDM35DAK2@ubuntu.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <b43-dev@lists.infradead.org>, <brcm80211@lists.linux.dev>,
 <brcm80211-dev-list.pdl@broadcom.com>, <libertas-dev@lists.infradead.org>
Subject: Re: [PATCH] wifi: fix typos in comments
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Christian Lamparter" <chunkeey@gmail.com>, "Hemanth Selam"
 <hemanth.selam@gmail.com>, "Jeff Johnson" <jjohnson@kernel.org>, "Jiri
 Slaby" <jirislaby@kernel.org>, "Nick Kossifidis" <mickflemm@gmail.com>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Arend van Spriel"
 <arend.vanspriel@broadcom.com>, "Stanislav Yakovlev"
 <stas.yakovlev@gmail.com>, "Stanislaw Gruszka" <stf_xl@wp.pl>, "Michael
 Buesch" <m@bues.ch>
X-Mailer: aerc 0.21.0
References: <20260904124353.6183-1-hemanth.selam@gmail.com>
 <d739eb56-b37d-4056-abf2-c3a4c9ba8662@gmail.com>
In-Reply-To: <d739eb56-b37d-4056-abf2-c3a4c9ba8662@gmail.com>

On Sun Sep 6, 2026 at 6:44 AM EDT, Christian Lamparter wrote:
> On 9/4/26 2:43 PM, Hemanth Selam wrote:
>> Fix typos in comments, reported by scripts/checkpatch.pl using the
>> misspelling list in scripts/spelling.txt.  Only touches comments, no cod=
e
>> changes.
>>=20
>> Assisted-by: Cursor:claude-opus-5
>> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> Sure, for the p54 and carl9170 parts:
>
> Acked-by: Christian Lamparter <chunkeey@gmail.com>
>
> Does anyone know what ever happened to the trivial-patches?
> https://www.kernel.org/pub/linux/kernel/people//rusty/trivial/template-in=
dex.html
> Is this still going?

As a kernel newbie, I've never heard of this. I've heard of kernel-
janitors but even that seems not as active..

-Josh
