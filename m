Received: from magratgarlick.emantor.de (magratgarlick.emantor.de [78.46.208.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB1B275B07
	for <brcm80211@lists.linux.dev>; Tue, 15 Jul 2025 08:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.208.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752568807; cv=none; b=QCg62tcHcJ9ftTX/pnoLyP/PDZumOuF0swQeq+UW2fh5/nrXLZSq0kc1e48ouQzMslFe9yTW/ExT31lC/dDegOuY75JDgD8zDAvtUa6QagQe1kw6beOiqki90D3FFhGkbISzHAyptLpSYeu3G0cbLIdcMjb2Ur0758Q/gXBOXsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752568807; c=relaxed/simple;
	bh=c2ZEHMeZfe6fEzZ6fh4sObpArfyz/YrkzC7XMHsOx5A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z/unxSCZ63rd0+ZcV32UMbNIno7690lGHX4NP970b7Ql9LqLOoxlvA3owW2awDT+5dGQzgmmVaPCQb0+Xn4zyeYEVPhtR5m51chhcrDuObHCl0PAfisyw+65iDtv9qXsbMEEifU8K1BH2qF4HG/eKinQl5p2/N8xLIkdrgWG3xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=czerwinskis.de; spf=pass smtp.mailfrom=czerwinskis.de; dkim=pass (1024-bit key) header.d=czerwinskis.de header.i=@czerwinskis.de header.b=taQo9BVx; dkim=pass (1024-bit key) header.d=czerwinskis.de header.i=@czerwinskis.de header.b=hUIJ8oau; arc=none smtp.client-ip=78.46.208.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=czerwinskis.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=czerwinskis.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=czerwinskis.de header.i=@czerwinskis.de header.b="taQo9BVx";
	dkim=pass (1024-bit key) header.d=czerwinskis.de header.i=@czerwinskis.de header.b="hUIJ8oau"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=czerwinskis.de;
	s=mail; t=1752568238;
	bh=c2ZEHMeZfe6fEzZ6fh4sObpArfyz/YrkzC7XMHsOx5A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=taQo9BVxoyuM803H0JTTxnLID0RKV5apUSbDpBxSoUa1+2NEZjS1xJWawZ7dy45yg
	 3FwP+cJKZBZFZ2Pse1MpDy93GdGlS3FtKKIUBn/0mZP0RMSvj2HiXa36MPWAaBB6zK
	 B3AWSwnv114PeHjOWVJ8H9PUNz+Iyk29NoWQUn1E=
Received: by magratgarlick.emantor.de (Postfix, from userid 114)
	id 2539D98503; Tue, 15 Jul 2025 10:30:38 +0200 (CEST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=czerwinskis.de;
	s=mail; t=1752568237;
	bh=c2ZEHMeZfe6fEzZ6fh4sObpArfyz/YrkzC7XMHsOx5A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=hUIJ8oaupDj/pg8SMu9UEqJffK/2JFQcvFbzSJBsGH/Lrj1nEFpy3woDlm2olZRTM
	 Sz7CKuu9gppuzzEMQAoxYUJmCVsUFmW7s0Hbw0cktF5OkMGoE+PmXIvHkvM1ookpan
	 COUh8Tl3YktWvDfGWTdnhQP4RPnEWqACXp0uV3VY=
Received: from [IPv6:2001:9e8:6964:2e01:36bc:e97d:1177:d80c] (unknown [IPv6:2001:9e8:6964:2e01:36bc:e97d:1177:d80c])
	by magratgarlick.emantor.de (Postfix) with ESMTPSA id 2EFD5984F8;
	Tue, 15 Jul 2025 10:30:37 +0200 (CEST)
Message-ID: <8862907338725d48e4966993e639f680d59156ad.camel@czerwinskis.de>
Subject: Re: [PATCH 1/2] brcmfmac: remove unreachable poll mode for sdio
From: Rouven Czerwinski <rouven@czerwinskis.de>
To: Arend Van Spriel <arend.vanspriel@broadcom.com>
Cc: kernel@pengutronix.de, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	linux-kernel@vger.kernel.org
Date: Tue, 15 Jul 2025 10:30:36 +0200
In-Reply-To: <197eae1ad60.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
References: <20250621112912.180436-1-rouven@czerwinskis.de>
	 <197eae1ad60.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Arend,

On Tue, 2025-07-08 at 18:32 +0200, Arend Van Spriel wrote:
> On June 21, 2025 1:29:17 PM Rouven Czerwinski <rouven@czerwinskis.de>
> wrote:
>=20
> > The sdio interface implements an unreachable poll mode. Remove it
> > since
> > the code can't be reached, if the poll mode needs to be implemented
> > it
> > can simply be resurrected using the usual git means.
>=20
> Thanks, Rouven
>=20
> This functionality has been/can be useful so instead of ripping it
> out I=20
> would prefer to have a proper knob for it in debugfs.

It's probably easier to make this a module parameter instead, I think
that live switching may be harder to implement.

That said, I no longer have access to the hardware where this can be
tested, so I can't continue with this suggestion.

Thanks for the input and Regards,
Rouven

>=20
> Regards,
> Arend
>=20
> > Signed-off-by: Rouven Czerwinski <rouven@czerwinskis.de>
> > ---
> > .../broadcom/brcm80211/brcmfmac/sdio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 48 +---------------
> > ---
> > 1 file changed, 2 insertions(+), 46 deletions(-)
>=20
